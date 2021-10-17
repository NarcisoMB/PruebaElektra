//  SerieAPI.swift
//  PruebaElektra
//  Created by Narciso Meza on 21/08/21.

import Foundation

/*
            Metodo que trae Series Populares
*/
func fetchPopularSeries(completion: @escaping (SerieResults) -> Void){
    
    let url = URL(string: "\(apiURL)/tv/popular?api_key=\(API_KEY)")
    let request = URLRequest(url: url!)
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
            if let response = try? JSONDecoder().decode(SerieResults.self, from: data) {
                DispatchQueue.main.async {
                    completion(response)
                }
                return
            }
        }
    }.resume()
}

/*
            Metodo que trae Series Que Se Estan Emitiendo
*/
func fetchPlayingNowSeries(completion: @escaping (SerieResults) -> Void){
    
    let url = URL(string: "\(apiURL)/tv/on_the_air?api_key=\(API_KEY)")
    let request = URLRequest(url: url!)
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
            if let response = try? JSONDecoder().decode(SerieResults.self, from: data) {
                DispatchQueue.main.async {
                    completion(response)
                }
                return
            }
        }
    }.resume()
}

/*
            Metodo que trae Series Por ID
*/
func fetchSerieById(completion: @escaping (SerieDetail) -> Void){
    
    let url = URL(string: "\(apiURL)/tv/\(String(describing: userDefaults.integer(forKey: "id")))?api_key=\(API_KEY)")
    let request = URLRequest(url: url!)
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
            if let response = try? JSONDecoder().decode(SerieDetail.self, from: data) {
                DispatchQueue.main.async {
                    completion(response)
                }
                return
            }
        }
    }.resume()
}

/*
            Metodo que trae el Reporto de Series
*/
func fetchSeriesCrew(completion: @escaping (SerieCrew) -> Void){
    
    let url = URL(string: "\(apiURL)/tv/\(String(describing: userDefaults.integer(forKey: "id")))/credits?api_key=\(API_KEY)")
    let request = URLRequest(url: url!)
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
            if let response = try? JSONDecoder().decode(SerieCrew.self, from: data) {
                DispatchQueue.main.async {
                    completion(response)
                }
                return
            }
        }
    }.resume()
}
