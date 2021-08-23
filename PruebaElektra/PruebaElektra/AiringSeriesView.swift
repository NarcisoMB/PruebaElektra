//  AiringSeriesView.swift
//  PruebaElektra
//  Created by Narciso Meza on 21/08/21.

import SwiftUI
import Kingfisher

struct AiringSeriesView: View {
    
    @State private var playingNowSeries: SerieResults!
    
    var body: some View {
        ScrollView(.vertical){
            VStack{
                if playingNowSeries != nil{
                    ForEach(playingNowSeries.results){serie in
                        Button(action: {
                            print("\(serie.name)")
                        }){
                            ZStack{
                                KFImage(URL(string: imagesURL + serie.backdrop_path))
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.3, alignment: .center)
                                VStack{
                                    Spacer()
                                    Text("\(serie.name)")
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
                    print(apiRes)
                    playingNowSeries = apiRes
                }
            }
        }
    }
}

struct AiringSeriesView_Previews: PreviewProvider {
    static var previews: some View {
        AiringSeriesView()
    }
}
