//  Helper.swift
//  PruebaElektra
//  Created by Narciso Meza on 22/08/21.

import Foundation
import SwiftUI

class SwiftUIViewCModel: ObservableObject {
    @Published var state : SwiftUIViewCModelState = .moviesViews
    
    static let shared = SwiftUIViewCModel()
    
    private init() {}
}

enum SwiftUIViewCModelState {
    case moviesViews
    case seriesViews
}

extension Array {
    func split() -> (left: [Element], right: [Element]) {
        let ct = self.count
        let half = ct / 2
        let leftSplit = self[0 ..< half]
        let rightSplit = self[half ..< ct]
        return (left: Array(leftSplit), right: Array(rightSplit))
    }
}
