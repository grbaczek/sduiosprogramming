//
//  ChuckNorrisJokesViewModel.swift
//  ChuckNorrisJokesCoreData
//
//  Created by Benjamin Staugaard on 30/11/2021.
//

import Foundation
import Combine
import CoreData

struct ParsedChuckNorrisJoke: Codable {
    var id: String
    var value: String
}

class ChuckNorrisJokesViewModel: ObservableObject{
    let context = PersistenceController.shared.container.viewContext
    let session = URLSession(configuration: .default)
    let chuckNorrisWebServiceUrl = "https://api.chucknorris.io/jokes/random"
    var cancellable: Cancellable? = nil
    let jsonDecoder = JSONDecoder()
    
    @Published var chuckNorrisJokes: [ChuckNorrisJoke] = []
    @Published var downloadingJoke: Bool = false
    
    init() {
        let request = NSFetchRequest<ChuckNorrisJoke>(entityName: "ChuckNorrisJoke")
        if let jokes = try? context.fetch(request) {
            chuckNorrisJokes.append(contentsOf: jokes.reversed())
        }
    }
    
    func getCurrentJoke(){
        var request = URLRequest(url: URL(string: chuckNorrisWebServiceUrl)!)
        request.httpMethod = "GET"
        downloadingJoke = true
        let url = URL(string: chuckNorrisWebServiceUrl)!
        cancellable?.cancel()
        cancellable = session
            .dataTaskPublisher(for: url)
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: ParsedChuckNorrisJoke.self, decoder: JSONDecoder())
            .delay(for: 1, scheduler: RunLoop.main) // One second delay for ProgressView/Opacity demonstration. Can be removed.
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.downloadingJoke = false
            }, receiveValue: { [weak self] joke in
                if let con = self?.context {
                    let newJoke = ChuckNorrisJoke(context: con)
                    newJoke.id = joke.id
                    newJoke.joke = joke.value
                    if (try? con.save()) != nil {
                        self?.chuckNorrisJokes.insert(newJoke, at: 0)
                    }
                }
                
            })
    }
    
    func remove(at offsets: IndexSet) {
        offsets.forEach { i in
            context.delete(chuckNorrisJokes[i])
            if (try? context.save()) != nil {
                chuckNorrisJokes.remove(atOffsets: offsets)
            }
        }
    }
}
