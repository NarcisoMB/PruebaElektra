//  AiringSeriesView.swift
//  PruebaElektra
//  Created by Narciso Meza on 21/08/21.

import SwiftUI
import Kingfisher

struct AiringSeriesView: View {
    
    @Binding var detailView: Bool
    @State private var playingNowSeries: SerieResults!
    
    var body: some View {
        ScrollView(.vertical){
            if playingNowSeries != nil{
                HStack{
                    VStack{
                        ForEach(playingNowSeries.results.split().left){serie in
                            Button(action: {
                                detailView.toggle()
                                userDefaults.set(serie.id, forKey: "id")
                                userDefaults.set("serie", forKey: "object")
                            }){
                                ZStack{
                                    KFImage(URL(string: imagesURL + serie.poster_path))
                                        .resizable()
                                        .frame(width: screenSize.width*0.4, height: screenSize.height*0.27, alignment: .center)
                                }
                            }
                            .cornerRadius(25)
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.leading, screenSize.width*0.06)
                    VStack{
                        ForEach(playingNowSeries.results.split().right){serie in
                            Button(action: {
                                detailView.toggle()
                                userDefaults.set(serie.id, forKey: "id")
                                userDefaults.set("serie", forKey: "object")
                            }){
                                ZStack{
                                    KFImage(URL(string: imagesURL + serie.poster_path))
                                        .resizable()
                                        .frame(width: screenSize.width*0.4, height: screenSize.height*0.27, alignment: .center)
                                }
                            }
                            .cornerRadius(25)
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal, screenSize.width*0.06)
                }
            }else{
                Spacer()
                    .frame(height: screenSize.height*0.35)
                LoadingView()
            }
        }
        .onAppear(){
            fetchPlayingNowSeries(){apiRes in
                playingNowSeries = apiRes
            }
        }
    }
}
