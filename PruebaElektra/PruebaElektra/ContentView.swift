//  ContentView.swift
//  PruebaElektra
//  Created by Narciso Meza on 21/08/21.

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            PopularMoviesView()
            HStack {
                TabBarIcon(width: screenSize.width/4, height: screenSize.height/48, systemIconName: "film", tabName: "Popular Movies")
                TabBarIcon(width: screenSize.width/4, height: screenSize.height/48, systemIconName: "film", tabName: "New Movies")
                TabBarIcon(width: screenSize.width/4, height: screenSize.height/48, systemIconName: "tv", tabName: "Popular Series")
                TabBarIcon(width: screenSize.width/4, height: screenSize.height/48, systemIconName: "tv", tabName: "New Series")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
