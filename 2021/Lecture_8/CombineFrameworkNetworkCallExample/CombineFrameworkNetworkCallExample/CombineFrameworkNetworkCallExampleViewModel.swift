//
//  CombineFrameworkNetworkCallExampleViewModel.swift
//  CombineFrameworkNetworkCallExample
//
//  Created by Grzegorz Baczek on 31/10/2021.
//

import Foundation
import Combine

struct TimeResponse: Codable {
    var abbreviation: String
    var client_ip: String
    var datetime: String
}

class CombineFrameworkNetworkCallExampleViewModel: ObservableObject{
    let session = URLSession(configuration: .default)
    let timeWebServiceUrl = "https://worldtimeapi.org/api/timezone/Europe/Copenhagen"
    var cancellable: Cancellable? = nil
    
    @Published var currentTime: String = ""
    
    func getCurrentTime(){
        let url = URL(string: timeWebServiceUrl)!
        cancellable?.cancel()
        cancellable = session
            .dataTaskPublisher(for: url)
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                    httpResponse.statusCode == 200 else {
                        throw URLError(.badServerResponse)
                    }
                return element.data
                }
            .decode(type: TimeResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {
                print ("Received completion: \($0).") },
                  receiveValue: { [weak self] time in
                self?.currentTime = time.datetime
            })
    }
}
