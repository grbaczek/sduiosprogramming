//
//  ChuckNorrisJokesViewModel.swift
//  Exercise2
//
//  Created by Grzegorz Baczek on 31/10/2021.
//

import Foundation
import Combine

struct ChuckNorrisJoke: Codable {
    var id: String
    var value: String
}


class ChuckNorrisJokesViewModel: ObservableObject{
    let session = URLSession(configuration: .default)
    let chuckNorrisWebServiceUrl = "https://api.chucknorris.io/jokes/random"
    var cancellable: Cancellable? = nil
    let jsonDecoder = JSONDecoder()
    
    @Published var currentJoke: String = ""
    @Published var downloadingJoke: Bool = false
    
    func getCurrentJoke(){
        var request = URLRequest(url: URL(string: chuckNorrisWebServiceUrl)!)
        request.httpMethod = "GET"
        downloadingJoke = true
        let url = URL(string: chuckNorrisWebServiceUrl)!
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
            .decode(type: ChuckNorrisJoke.self, decoder: JSONDecoder())
            .delay(for: .seconds(2), scheduler: RunLoop.main, options: .none)
            .sink(receiveCompletion: { [weak self] completion in
                self?.downloadingJoke = false
              },
                  receiveValue: { [weak self] joke in
                self?.currentJoke = joke.value
            })
    }
}
