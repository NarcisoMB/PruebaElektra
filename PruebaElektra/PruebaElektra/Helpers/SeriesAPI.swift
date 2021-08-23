//  SeriesAPI.swift
//  PruebaElektra
//  Created by Narciso Meza on 21/08/21.

import Foundation
func fetchPopularSeries(completion: @escaping (SerieResults) -> Void){
    
    let url = URL(string: apiURL + "/tv/popular?api_key=" + API_KEY)
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

func fetchPlayingNowSeries(completion: @escaping (SerieResults) -> Void){
    
    let url = URL(string: apiURL + "/tv/on_the_air?api_key=" + API_KEY)
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
