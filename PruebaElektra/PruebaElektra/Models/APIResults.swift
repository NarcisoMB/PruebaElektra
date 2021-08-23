//  APIResults.swift
//  PruebaElektra
//  Created by Narciso Meza on 21/08/21.

import Foundation
struct MovieResults: Codable {
    var page: Int
    var results: [Movie]
    var total_pages: Int
    var total_results: Int
    
}

struct SerieResults: Codable {
    var page: Int
    var results: [Serie]
    var total_pages: Int
    var total_results: Int
    
}
