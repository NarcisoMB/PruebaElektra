//  APIResults.swift
//  PruebaElektra
//  Created by Narciso Meza on 21/08/21.

import Foundation
struct APIResults: Codable {
    var page: Int
    var results: [Movie]
    var total_pages: Int
    var total_results: Int
    
}
