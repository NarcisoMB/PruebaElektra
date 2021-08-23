//  Serie.swift
//  PruebaElektra
//  Created by Narciso Meza on 23/08/21.

import Foundation
struct Serie: Identifiable, Codable {
    var backdrop_path : String?
//    var episode_run_time : [Int]
    var first_air_date : String
//    var last_air_date : String
//    var number_of_episodes : String
//    var number_of_Seasons : String
    var genre_ids : [Int]
    var id : Int
//    var tagline : String
//    var homepage : String
//    var status : String
    var name : String
//    var origin_country : [String]
    var original_language : String
    var original_name : String
    var overview : String
    var popularity : Double
    var poster_path : String
    var vote_average : Float
    var vote_count : Int
    
}
