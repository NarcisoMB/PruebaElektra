//  SerieDetail.swift
//  PruebaElektra
//  Created by Narciso Meza on 23/08/21.

import Foundation
struct SerieDetail: Identifiable, Codable {
    var backdrop_path: String?
    var created_by: [Creator]
    var episode_run_time: [Int]
    var first_air_date: String
    var genres: [Genre]
    var homepage: String
    var id: Int
    var in_production: Bool
    var languages: [String]
    var last_air_date: String
    var last_episode_to_air: EpisodeAir?
    var name: String
    var next_episode_to_air: EpisodeAir?
    var networks: [Network]
    var number_of_episodes: Int
    var number_of_seasons: Int
    var origin_country: [String]
    var original_language: String
    var original_name: String
    var overview: String
    var popularity: Double
    var poster_path: String
    var production_companies: [ProductionCompany]
    var production_countries: [ProductionCountry]
    var seasons: [Seasons]
    var spoken_languages: [Language]
    var status: String
    var tagline: String
    var type: String
    var vote_average: Float
    var vote_count: Int
    
}
