//  ContentView.swift
//  PruebaElektra
//  Created by Narciso Meza on 21/08/21.

import SwiftUI

struct ContentView: View {
    
    @State var selected = 0
    @State var detailView = false
    @GestureState private var dragOffset: CGFloat = -100
    @ObservedObject var model = SwiftUIViewCModel.shared
    
    var body: some View {
        VStack{
            if detailView {
                DetailView()
            }else{
                Picker(selection: $selected, label: Text(""), content: {
                    Text("Most Popular").tag(0)
                    Text("Playing Now").tag(1)
                }).pickerStyle(SegmentedPickerStyle())
                
                if model.state == .moviesViews && selected == 1 {
                    AiringMoviesView(detailView: $detailView)
                }else if model.state == .seriesViews && selected == 1 {
                    AiringSeriesView(detailView: $detailView)
                }else if model.state == .moviesViews && selected == 0 {
                    PopularMoviesView(detailView: $detailView)
                }else if  model.state == .seriesViews && selected == 0 {
                    PopularSeriesView(detailView: $detailView)
                }
            }
            HStack{
                HStack {
                    Button(action: {
                        model.state = .moviesViews
                        detailView = false
                    }){
                        TabBarIcon(width: screenSize.width*0.5, height: screenSize.height/48, systemIconName: "film", tabName: "Movies")
                    }
                    Button(action: {
                        model.state = .seriesViews
                        detailView = false
                    }){
                        TabBarIcon(width: screenSize.width*0.5, height: screenSize.height/48, systemIconName: "tv", tabName: "Series")
                    }
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
