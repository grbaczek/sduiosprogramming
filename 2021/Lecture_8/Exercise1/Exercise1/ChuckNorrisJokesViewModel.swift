//
//  Exercise1ViewModel.swift
//  Exercise1
//
//  Created by Grzegorz Baczek on 31/10/2021.
//

import Foundation

struct ChuckNorrisJoke: Codable {
    var id: String
    var value: String
}


class ChuckNorrisJokesViewModel: ObservableObject{
    let session = URLSession(configuration: .default)
    let chuckNorrisWebServiceUrl = "https://api.chucknorris.io/jokes/random"
    var currentTask: URLSessionDataTask? = nil
    let jsonDecoder = JSONDecoder()
    
    @Published var currentJoke: String = ""
    @Published var downloadingJoke: Bool = false
    
    func getCurrentJoke(){
        var request = URLRequest(url: URL(string: chuckNorrisWebServiceUrl)!)
        request.httpMethod = "GET"
        currentTask?.cancel()
        downloadingJoke = true
        currentTask = session.dataTask(with: request, completionHandler: { [weak self] (data, response, error) in
            print("received response")
            sleep(2)
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let data = data, let joke = try? self?.jsonDecoder.decode(ChuckNorrisJoke.self, from: data) {
                DispatchQueue.main.async {
                    self?.currentJoke = joke.value
                }
            } else {
                print("Something went wrong. Try again.")
            }
            DispatchQueue.main.async {
                self?.downloadingJoke = false
            }
        })
        currentTask?.resume()
    }
}
