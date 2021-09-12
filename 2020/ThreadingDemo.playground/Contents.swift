import UIKit
import Foundation

struct joke : Decodable{
    let created_at : String
    let icon_url : String
    let id : String
    let updated_at : String
    let value: String
    
    var description: String{
        return "joke: \(value)"
    }
}

let session = URLSession(configuration: .default)
if let url = URL(string:"https://api.chucknorris.io/jokes/random"){
    let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
        DispatchQueue.main.async {
            // Check if Error took place
            if let error = error {
                print("Error took place \(error)")
                return
            }
            // Read HTTP Response Status code
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            // Convert HTTP Response Data to a simple String
            if let data = data, let dataString = String(data: data, encoding: .utf8),let currentJoke = try? JSONDecoder().decode(joke.self, from: data) {
                //print("Response data string:\n \(dataString)")
                print(currentJoke.description)
            }
               
        }
    })
    task.resume()
}
