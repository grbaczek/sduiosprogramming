/// Copyright (c) 2019 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

//api_key=3f50b45438c64826db8b003a3cd555f3&format=rest&api_sig=28cbb22d7ebec49379043147a70fd8d6
let apiKey = "3f50b45438c64826db8b003a3cd555f3"

struct FlickrSearchResults {
  let searchTerm : String
  let searchResults : [FlickrPhoto]
}

class FlickrAPI {
  private static let _defaultSession = URLSession(configuration: .default)
  private static var _dataTask: URLSessionDataTask?
}

// MARK: - Search
extension FlickrAPI {
  static func searchFlickrForTerm(_ searchTerm: String,
                                  completion: @escaping ((Result<FlickrSearchResults, Swift.Error>) -> Void)) {
    guard let searchURL = flickrSearchURLForSearchTerm(searchTerm) else {
      return
    }
    
    _dataTask?.cancel()
    
    let request = URLRequest(url: searchURL)
    
    _dataTask = _defaultSession.dataTask(with: request) { data, response, error in
      defer { self._dataTask = nil }
      
      let result = processSearchRequest(forSearchTerm: searchTerm,
                                        data: data,
                                        error: error)
      
      OperationQueue.main.addOperation {
        completion(result)
      }
    }
    _dataTask?.resume()
  }
  
  private static func processSearchRequest(forSearchTerm searchTerm: String,
                                           data: Data?,
                                           error: Swift.Error?) -> Result<FlickrSearchResults, Swift.Error> {
    if let error = error {
      return .failure(error)
    }
    
    guard let data = data else {
      return .failure(Error.noData)
    }
    
    guard
      let json = try? JSONSerialization.jsonObject(with: data, options: []),
      let results = json as? [String:Any]
      else {
        return .failure(Error.jsonSerializationFailed(reason: "Failed to convert data to JSON"))
    }
    
    guard let apiResponse = results["stat"] as? String else {
      return .failure(Error.requestFailed(reason: "No status info in JSON response"))
    }
    
    let message = (results["message"] as? String) ?? ""
    
    switch apiResponse {
    case "ok":
      print("Results processed OK.\n" + message)
    case "fail":
      return .failure(Error.requestFailed(reason: "Request failed.\n" + message))
    default:
      return .failure(Error.requestFailed(reason: "Unknown API response.\n" + message))
    }
    
    guard
      let photosContainer = results["photos"] as? [String:Any],
      let photosReceived = photosContainer["photo"] as? [[String:Any]],
      let photosData = jsonToString(photosReceived)?.data(using: .utf8),
      let flickrPhotos = try? JSONDecoder().decode([FlickrPhoto].self, from: photosData)
      else {
        return .failure(Error.processingPhotosFailed(reason: "Could not get photos from JSON payload"))
    }
    return .success(FlickrSearchResults(searchTerm: searchTerm,
                                        searchResults: flickrPhotos))
  }
  
  private static func jsonToString(_ json: Any) -> String? {
    guard let data = try? JSONSerialization.data(withJSONObject: json,
                                                 options: .prettyPrinted),
      let converted = String(data: data, encoding: .utf8) else {
        return nil
    }
    return converted
  }
  
  private static func flickrSearchURLForSearchTerm(_ searchTerm:String) -> URL? {
    if let escapedTerm = searchTerm.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
      let URLString = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(apiKey)&text=\(escapedTerm)&per_page=60&format=json&nojsoncallback=1"
      return URL(string: URLString)
    }
    return nil
  }
}

// MARK: - Image Loading
extension FlickrAPI {
  typealias FetchImageResult = Result<UIImage, Swift.Error>
  typealias FetchImageCompletion = (FetchImageResult) -> Void
  
  static func imageURL(for photo: FlickrPhoto, size:String = "m") -> URL {
    return URL(string: "https://farm\(photo.farm).staticflickr.com/\(photo.server)/\(photo.id)_\(photo.secret)_\(size).jpg")!
  }
  
  static func loadLargeImage(for photo: FlickrPhoto,
                             completion: @escaping FetchImageCompletion) {
    loadImage(for: photo, withSize: "b", completion)
  }
  
  static func _processImageRequest(_ data: Data?,
                                   _ error: Swift.Error?) -> FetchImageResult {
    guard
      let imageData = data,
      let image = UIImage(data: imageData)
      else {
        if let error = error, data == nil {
          return .failure(error)
        }
        else {
          return .failure(Error.imageCreationFailed)
        }
    }
    return Result.success(image)
  }
  
  static func loadImage(for photo: FlickrPhoto,
                        withSize size: String,
                        _ completion: @escaping FetchImageCompletion) {
    let session = URLSession.shared
    
    let url = imageURL(for: photo, size: size)
    
    let dataTask = session.dataTask(with: url) { data, response, error in
      let result = self._processImageRequest(data, error)
      
      OperationQueue.main.addOperation {
        completion(result)
      }
    }
    dataTask.resume()
  }
}

// MARK: - Error Definitions
extension FlickrAPI {
  enum Error: Swift.Error {
    case noData
    case jsonSerializationFailed(reason: String)
    case requestFailed(reason: String)
    case processingPhotosFailed(reason: String)
    case imageCreationFailed
  }
}

extension FlickrAPI.Error: LocalizedError {
  var errorDescription: String? {
    switch self {
    case .noData:
      return "No data returned with response"
    case .jsonSerializationFailed(let reason):
      return reason
    case .requestFailed(let reason):
      return reason
    case .processingPhotosFailed(let reason):
      return reason
    case .imageCreationFailed:
      return "Could not create image from returned data"
    }
  }
}
