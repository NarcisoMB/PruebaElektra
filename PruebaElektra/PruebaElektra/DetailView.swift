//  MovieDetailView.swift
//  PruebaElektra
//  Created by Narciso Meza on 23/08/21.

import SwiftUI
import Kingfisher

struct DetailView: View {
    
    @State var year: String!
    //    @State var serie: Seri!
    @State private var movieD: MovieDetail!
    
    var body: some View {
        ScrollView(.vertical){
            VStack{
                //            if true /*serie == nil*/{
                //                /*Series*/
                //                Text("Series")
                //            }else{
                //                /*Movies*/
                //
                //            }
                if movieD == nil{
                    Spacer()
                        .frame(height: screenSize.height*0.35)
                    LoadingView()
                }else{
                    ZStack{
                        VStack{
                            KFImage(URL(string: imagesURL + movieD.backdrop_path))
                                .resizable()
                                .frame(width: screenSize.width, height: screenSize.height*0.3)
                            Rectangle()
                                .fill(Color.black)
                                .frame(width: screenSize.width)
                        }
                        VStack(alignment: .leading){
                            HStack{
                                KFImage(URL(string: imagesURL + movieD.poster_path))
                                    .resizable()
                                    .cornerRadius(25)
                                    .frame(width: screenSize.width*0.4, height: screenSize.height*0.3)
                                    .padding(.leading, screenSize.width*0.04)
                                VStack(alignment: .leading){
                                    HStack{
                                        Text("\(movieD.original_title)")
                                            .bold()
                                        Text("(\(year))")
                                    }
                                    Text("User Score")
                                        .bold()
                                    Text("\(String(format:"%.01f", movieD.vote_average)) / 10")
                                }
                                .padding(.top, screenSize.height*0.16)
                            }
                            HStack{
                                Spacer()
                                Text("\(movieD.tagline)")
                                Spacer()
                            }
                            Group{
                                Text("Overview")
                                    .bold()
                                Text("\(movieD.overview)")
                            }
                            .padding(.horizontal, screenSize.height*0.01)
                            HStack{
                                if movieD.budget > 0 {
                                    VStack(alignment: .leading){
                                        Text("Budget")
                                            .bold()
                                        Text("$\(movieD.budget)")
                                    }
                                    .padding([.top, .horizontal], screenSize.height*0.01)
                                }
                                if movieD.revenue > 0 {
                                    VStack(alignment: .leading){
                                        Text("Revenue")
                                            .bold()
                                        Text("$\(movieD.revenue)")
                                    }
                                    .padding([.top, .horizontal], screenSize.height*0.01)
                                }
                            }
                            Group{
                                Text("Genres")
                                    .bold()
                                    .padding(.top, screenSize.height*0.01)
                                HStack{
                                    ForEach(movieD.genres){genre in
                                        Text("\(genre.name)")
                                    }
                                }
                            }
                            .padding(.horizontal, screenSize.height*0.01)
                        }
                        .padding(.top, screenSize.height*0.12)
                    }
                    
                }
            }
        }
        .onAppear(){
            if userDefaults.string(forKey: "object") == "movie" {
                fetchMoviesById(){movie in
                    movieD = movie
                    year = String(self.movieD.release_date.split(separator: "-")[0])
                    print(movieD!)
                }
            }/*else if userDefaults.string(forKey: "object") == "serie" {
             
             }*/
        }
    }
}
