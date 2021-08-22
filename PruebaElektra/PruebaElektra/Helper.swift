//  Helper.swift
//  PruebaElektra
//  Created by Narciso Meza on 21/08/21.

import Foundation
func fetchPopularMovies() {
    let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=2dd070830ec9b7cbdfc3675b4eb8939b"
    guard let url = URL(string: urlString) else {return}
    URLSession.shared.dataTask(with: url) { (data, res, error) in
        do {
            print(data)
//            DispatchQueue.main.async {}
        } catch {}
    }.resume()
}
