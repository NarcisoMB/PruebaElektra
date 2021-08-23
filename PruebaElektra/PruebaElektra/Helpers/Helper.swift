//  Helper.swift
//  PruebaElektra
//  Created by Narciso Meza on 22/08/21.

import Foundation
import SwiftUI

class SwiftUIViewCModel: ObservableObject {
    @Published var state : SwiftUIViewCModelState = .airingMoviesView
    
    static let shared = SwiftUIViewCModel()
    
    private init() {}
}

enum SwiftUIViewCModelState {
    case airingMoviesView
    case airingSeriesView
    case popularMoviesView
    case popularSeriesView
}
