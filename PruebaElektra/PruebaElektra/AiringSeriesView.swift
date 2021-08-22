//  AiringSeriesView.swift
//  PruebaElektra
//  Created by Narciso Meza on 21/08/21.

import SwiftUI
import Kingfisher

struct AiringSeries: View {
    
    @State private var playingNowSeries: APIResults!
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical){
                VStack{
                    if playingNowSeries != nil{
                        ForEach(playingNowSeries.results){movie in
                            Button(action: {
                                print("\(movie.title)")
                            }){
                                ZStack{
                                    KFImage(URL(string: imagesURL + movie.backdrop_path))
                                        .resizable()
                                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.3, alignment: .center)
                                    VStack{
                                        Spacer()
                                        Text("\(movie.title)")
                                            .font(.title)
                                            .padding(.bottom, 6)
                                            .background(
                                                Color.gray
                                                    .opacity(0.5)
                                                    .frame(width: UIScreen.main.bounds.width)
                                            )
                                    }
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }else{
                        LoadingView()
                    }
                }
                .onAppear(){
                    fetchPlayingNowSeries(){apiRes in
                        playingNowSeries = apiRes
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Now Playing Series")
                }
            }
        }
    }
}

struct AiringSeries_Previews: PreviewProvider {
    static var previews: some View {
        AiringSeries()
    }
}
