//  ContentView.swift
//  PruebaElektra
//  Created by Narciso Meza on 21/08/21.

import SwiftUI

struct ContentView: View {
    
    @State var selected = 0
    @ObservedObject var model = SwiftUIViewCModel.shared
    
    var body: some View {
        VStack{
            Picker(selection: $selected, label: Text(""), content: {
                Text("Most Popular").tag(0)
                Text("Playing Now").tag(1)
            }).pickerStyle(SegmentedPickerStyle())
            if model.state == .airingMoviesView && selected == 1{
                AiringMoviesView()
            }else if model.state == .airingSeriesView && selected == 1 {
                AiringSeriesView()
            }else if model.state == .popularMoviesView && selected == 0 {
                PopularMoviesView()
            }else if  model.state == .popularSeriesView && selected == 0 {
                PopularSeriesView()
            }
            HStack{
                HStack {
                    TabBarIcon(width: screenSize.width*0.5, height: screenSize.height/48, systemIconName: "film", tabName: "Movies")
                    TabBarIcon(width: screenSize.width*0.5, height: screenSize.height/48, systemIconName: "tv", tabName: "Series")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
