//
//  NetworkCallExampleViewModel.swift
//  NetworkCallExample
//
//  Created by Grzegorz Baczek on 30/10/2021.
//

import Foundation

struct TimeResponse: Codable {
    var abbreviation: String
    var client_ip: String
    var datetime: String
}


class NetworkCallExampleViewModel: ObservableObject{
    let session = URLSession(configuration: .default)
    let timeWebServiceUrl = "https://worldtimeapi.org/api/timezone/Europe/Copenhagen"
    var currentTask: URLSessionDataTask? = nil
    let jsonDecoder = JSONDecoder()
    
    @Published var currentTime: String = ""
    
    func getCurrentTime(){
        var request = URLRequest(url: URL(string: timeWebServiceUrl)!)
        request.httpMethod = "GET"
        currentTask?.cancel()
        currentTask = session.dataTask(with: request, completionHandler: { [weak self] (data, response, error) in
            print("received response")
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let data = data, let time = try? self?.jsonDecoder.decode(TimeResponse.self, from: data) {
                DispatchQueue.main.async {
                    self?.currentTime = time.datetime
                }
            } else {
                print("Something went wrong. Try again.")
            }
        })
        currentTask?.resume()
    }
}
