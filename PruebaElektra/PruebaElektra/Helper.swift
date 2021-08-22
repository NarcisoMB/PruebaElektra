//  Helper.swift
//  PruebaElektra
//  Created by Narciso Meza on 21/08/21.

import Foundation
func fetchPopularMovies(completion: @escaping (APIResults) -> Void){
    let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=2dd070830ec9b7cbdfc3675b4eb8939b")
    let request = URLRequest(url: url!)
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
            if let response = try? JSONDecoder().decode(APIResults.self, from: data) {
                DispatchQueue.main.async {
                    completion(response)
                }
                return
            }
        }
    }.resume()
}
