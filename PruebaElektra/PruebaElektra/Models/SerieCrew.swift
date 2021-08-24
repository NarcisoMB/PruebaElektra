//  SerieCrew.swift
//  PruebaElektra
//  Created by Narciso Meza on 23/08/21.

import Foundation
struct SerieCrew: Identifiable, Codable {
    var cast: [Actor]
    var crew: [Person]
    var id: Int
    
}
