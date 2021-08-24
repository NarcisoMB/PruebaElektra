//  EpisodeAir.swift
//  PruebaElektra
//  Created by Narciso Meza on 23/08/21.

import Foundation
struct EpisodeAir: Identifiable, Codable {
    var air_date: String
    var episode_number: Int
    var id: Int
    var name: String
    var overview: String
    var production_code: String
    var season_number: Int
    var still_path: String?
    var vote_average: Float
    var vote_count: Int
    
}
