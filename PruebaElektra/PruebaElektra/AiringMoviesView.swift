//  AiringMoviesView.swift
//  PruebaElektra
//  Created by Narciso Meza on 21/08/21.

import SwiftUI
import Kingfisher

struct AiringMoviesView: View {
    
    @State private var playingNowMovies: MovieResults!
    
    var body: some View {
        ScrollView(.vertical){
            VStack{
                if playingNowMovies != nil{
                    ForEach(playingNowMovies.results){movie in
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
                                        .font(.title2)
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
                    Spacer()
                        .frame(height: UIScreen.main.bounds.height*0.35)
                    LoadingView()
                }
            }
        }
        .onAppear(){
            fetchPlayingNowMovies(){apiRes in
                playingNowMovies = apiRes
            }
        }
    }
}

struct AiringMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        AiringMoviesView()
    }
}
