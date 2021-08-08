//
//  MusicAPI.swift
//  fourfour
//
//  Created by callan on 2021-06-05.
//

import Foundation

struct Example: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

func getJson(completion: @escaping (Example)-> ()) {
    let urlString = "https://jsonplaceholder.typicode.com/todos/1"
    if let url = URL(string: urlString) {
        URLSession.shared.dataTask(with: url) {data, res, err in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let json: Example = try! decoder.decode(Example.self, from: data)
                    completion(json)
                }catch let error {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}

func getSong() -> String {
    return "got song"
}
