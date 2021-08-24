//  Serie.swift
//  PruebaElektra
//  Created by Narciso Meza on 23/08/21.

import Foundation
struct Serie: Identifiable, Codable {
    var backdrop_path : String?
    var first_air_date : String
    var genre_ids : [Int]
    var id : Int
    var name : String
    var original_language : String
    var original_name : String
    var overview : String
    var popularity : Double
    var poster_path : String
    var vote_average : Float
    var vote_count : Int
    
}
