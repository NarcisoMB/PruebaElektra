//  Video.swift
//  PruebaElektra
//  Created by Narciso Meza on 23/08/21.

import Foundation
struct Video: Identifiable, Codable {
    var iso_639_1: String
    var iso_3166_1: String
    var name: String
    var key: String
    var site: String
    var size: Int
    var type: String
    var official: Bool
    var published_at: String
    var id: String
    
}
