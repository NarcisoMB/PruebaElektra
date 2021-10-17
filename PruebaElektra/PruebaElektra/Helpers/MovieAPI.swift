//  MovieAPI.swift
//  PruebaElektra
//  Created by Narciso Meza on 21/08/21.

import Foundation

/*
            Metodo que trae Peliculas Populares
*/
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

/*
            Metodo que trae Peliculas Que Se Estan En Cines
*/
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

/*
            Metodo que trae Peliculas Por ID
*/
func fetchMoviesById(completion: @escaping (MovieDetail) -> Void){
    
    let url = URL(string: "\(apiURL)/movie/\(String(describing: userDefaults.integer(forKey: "id")))?api_key=\(API_KEY)")
    let request = URLRequest(url: url!)
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
            if let response = try? JSONDecoder().decode(MovieDetail.self, from: data) {
                DispatchQueue.main.async {
                    completion(response)
                }
                return
            }
        }
    }.resume()
}

/*
            Metodo que trae los Trailers de las Peliculas
*/
func fetchMovieVideo(completion: @escaping (VideoResults) -> Void){
    
    let url = URL(string: "\(apiURL)/movie/\(String(describing: userDefaults.integer(forKey: "id")))/videos?api_key=\(API_KEY)")
    let request = URLRequest(url: url!)
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
            if let response = try? JSONDecoder().decode(VideoResults.self, from: data) {
                DispatchQueue.main.async {
                    completion(response)
                }
                return
            }
        }
    }.resume()
}
