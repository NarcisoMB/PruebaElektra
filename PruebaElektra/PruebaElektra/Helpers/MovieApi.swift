//  PruebaElektra
//  PruebaElektra
//  Created by Narciso Meza on 21/08/21.

import SwiftUI
import Foundation

func fetchPopularMovies(completion: @escaping (MovieResults) -> Void){
    
    let url = URL(string: "\(apiURL)/movie/popular?api_key=\(API_KEY)")
    let request = URLRequest(url: url!)
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
            if let response = try? JSONDecoder().decode(MovieResults.self, from: data) {
                DispatchQueue.main.async {
                    completion(response)
                }
                return
            }
        }
    }.resume()
}

func fetchPlayingNowMovies(completion: @escaping (MovieResults) -> Void){
    
    let url = URL(string: "\(apiURL)/movie/now_playing?api_key=\(API_KEY)")
    let request = URLRequest(url: url!)
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
            if let response = try? JSONDecoder().decode(MovieResults.self, from: data) {
                DispatchQueue.main.async {
                    completion(response)
                }
                return
            }
        }
    }.resume()
}

func fetchMoviesById(completion: @escaping (MovieDetail) -> Void){
    
    let url = URL(string: "\(apiURL)/movie/\(String(describing: userDefaults.integer(forKey: "id")))?api_key=\(API_KEY)")
    let request = URLRequest(url: url!)
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
//            print(String(data: data, encoding: .utf8))
            if let response = try? JSONDecoder().decode(MovieDetail.self, from: data) {
                DispatchQueue.main.async {
                    completion(response)
                }
                return
            }
        }
    }.resume()
}

func fetchMovieVideo(completion: @escaping (VideoResults) -> Void){
    
    let url = URL(string: "\(apiURL)/movie/\(String(describing: userDefaults.integer(forKey: "id")))/videos?api_key=\(API_KEY)")
    let request = URLRequest(url: url!)
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
//            print(String(data: data, encoding: .utf8))
            if let response = try? JSONDecoder().decode(VideoResults.self, from: data) {
                DispatchQueue.main.async {
                    completion(response)
                }
                return
            }
        }
    }.resume()
}
