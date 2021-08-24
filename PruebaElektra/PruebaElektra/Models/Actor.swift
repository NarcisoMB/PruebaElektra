//  Actor.swift
//  PruebaElektra
//  Created by Narciso Meza on 23/08/21.

import Foundation
struct Actor: Identifiable, Codable {
    var adult: Bool
    var gender: Int
    var id: Int
    var known_for_department: String
    var name: String
    var original_name: String
    var popularity: Float
    var profile_path: String
    var character: String
    var credit_id: String
    var order: Int
    
}
