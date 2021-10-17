//  PopularMoviesView.swift
//  PruebaElektra
//  Created by Narciso Meza on 21/08/21.

import SwiftUI
import Kingfisher

struct PopularMoviesView: View {
    
    @Binding var detailView: Bool
    @State private var mostPopularMovies: MovieResults!
    
    var body: some View {
        ScrollView(.vertical){
            VStack{
                if mostPopularMovies != nil{
                    ForEach(mostPopularMovies.results){movie in
                        Button(action: {
                            detailView.toggle()
                            userDefaults.set(movie.id, forKey: "id")
                            userDefaults.set("movie", forKey: "object")
                        }){
                            ZStack{
                                KFImage(URL(string: imagesURL + movie.backdrop_path))
                                    .resizable()
                                    .frame(width: screenSize.width, height: screenSize.height*0.3, alignment: .center)
                                VStack{
                                    Spacer()
                                    Text("\(movie.title)")
                                        .font(.title2)
                                        .padding(.bottom, 6)
                                        .background(
                                            Color.gray
                                                .opacity(0.5)
                                                .frame(width: screenSize.width)
                                        )
                                }
                            }
                        }
                        .cornerRadius(25)
                        .buttonStyle(PlainButtonStyle())
                    }
                }else{
                    Spacer()
                        .frame(height: screenSize.height*0.35)
                    LoadingView()
                }
            }
            .onAppear(){
                fetchPopularMovies(){apiRes in
                    mostPopularMovies = apiRes
                }
            }
        }
    }
}
