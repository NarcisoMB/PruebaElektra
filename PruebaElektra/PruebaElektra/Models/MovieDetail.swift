//  MovieDetail.swift
//  PruebaElektra
//  Created by Narciso Meza on 23/08/21.

import Foundation
struct MovieDetail: Identifiable, Codable {
    var adult: Bool
    var backdrop_path: String
    var belongs_to_collection: Collection?
    var budget: Int
    var genres: [Genre]
    var homepage: String
    var id: Int
    var imdb_id: String
    var original_language: String
    var original_title: String
    var overview: String
    var popularity: Double
    var poster_path: String
    var production_companies: [ProductionCompany]
    var production_countries: [ProductionCountry]
    var release_date: String
    var revenue: Int
    var runtime: Int
    var spoken_languages: [Language]
    var status: String
    var tagline: String
    var title: String
    var video: Bool
    var vote_average: Float
    var vote_count: Int
}
