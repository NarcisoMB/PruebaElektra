//  MovieDetailView.swift
//  PruebaElektra
//  Created by Narciso Meza on 23/08/21.

import WebKit
import SwiftUI
import Kingfisher


struct DetailView: View {
    
    @State var trailerChoice = ""
    @State var releaseYear: String!
    @State private var serieD: SerieDetail!
    @State private var movieD: MovieDetail!
    @State private var serieCrew: SerieCrew!
    @State private var videosD: VideoResults!
    
    @StateObject var model = WebViewModel()

    
    var body: some View {
        ScrollView(.vertical){
            VStack{
                if userDefaults.string(forKey: "object") == "serie" && serieD != nil {
/*
                    Vista de Serie
 */
                    ZStack{
                        VStack{
                            if serieD.backdrop_path != nil{
                                KFImage(URL(string: imagesURL + serieD.backdrop_path!))
                                    .resizable()
                                    .frame(width: screenSize.width, height: screenSize.height*0.25)
                            }else{
                                Rectangle()
                                    .fill(Color.gray)
                                    .frame(width: screenSize.width, height: screenSize.height*0.25)
                            }
                            Rectangle()
                                .fill(Color.black)
                                .frame(width: screenSize.width)
                        }
                        VStack(alignment: .leading){
                            HStack{
                                KFImage(URL(string: imagesURL + serieD.poster_path))
                                    .resizable()
                                    .cornerRadius(25)
                                    .frame(width: screenSize.width*0.39, height: screenSize.height*0.27)
                                    .padding(.leading, screenSize.width*0.04)
                                VStack(alignment: .leading){
                                    HStack{
                                        Text("\(serieD.name)")
                                            .bold()
                                        Text("(\(releaseYear))")
                                    }
                                    Text("User Score")
                                        .bold()
                                    Text("\(String(format:"%.01f", serieD.vote_average)) / 10")
                                }
                                .padding(.top, screenSize.height*0.16)
                            }
                            HStack{
                                Spacer()
                                Text("\(serieD.tagline)")
                                Spacer()
                            }
                            Group{
                                Text("Overview")
                                    .bold()
                                Text("\(serieD.overview)")
                                    .frame(width: screenSize.width)
                            }
                            .padding(.horizontal, screenSize.height*0.01)
                            Group{
                                Text("Genres")
                                    .bold()
                                    .padding(.top, screenSize.height*0.01)
                                ScrollView(.horizontal){
                                    HStack{
                                        ForEach(serieD.genres){genre in
                                            Text("\(genre.name)")
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, screenSize.height*0.01)
                            Group{
                                Text("Creators")
                                    .bold()
                                    .padding(.top, screenSize.height*0.01)
                                ScrollView(.horizontal){
                                    HStack{
                                        ForEach(serieD.created_by){creator in
                                            Text("\(creator.name)")
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, screenSize.height*0.01)
                            if serieCrew != nil{
                                Group{
                                    Text("Actors")
                                        .bold()
                                        .padding(.top, screenSize.height*0.01)
                                    ScrollView(.horizontal){
                                        HStack{
                                            ForEach(serieCrew.cast){actors in
                                                VStack{
                                                    KFImage(URL(string: imagesURL + actors.profile_path))
                                                        .resizable()
                                                        .cornerRadius(50)
                                                        .frame(width: screenSize.width*0.24, height: screenSize.height*0.1)
                                                    Text("\(actors.name)")
                                                }
                                                .frame(height: screenSize.height*0.16)
                                            }
                                        }
                                    }
                                }
                                .padding([.leading, .bottom], screenSize.height*0.02)
                            }
                        }
                        .padding(.top, screenSize.height*0.12)
                    }
                }else if userDefaults.string(forKey: "object") == "movie" && movieD != nil{
/*
                    Vista de Peliculas
*/
                    ZStack{
                        VStack{
                            KFImage(URL(string: imagesURL + movieD.backdrop_path))
                                .resizable()
                                .frame(width: screenSize.width, height: screenSize.height*0.3)
                            Spacer()
                        }
                        VStack(alignment: .leading){
                            HStack{
                                KFImage(URL(string: imagesURL + movieD.poster_path))
                                    .resizable()
                                    .cornerRadius(25)
                                    .frame(width: screenSize.width*0.39, height: screenSize.height*0.3)
                                    .padding(.leading, screenSize.width*0.04)
                                VStack(alignment: .leading){
                                    HStack{
                                        Text("\(movieD.original_title)")
                                            .bold()
                                        Text("(\(releaseYear))")
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
                                    .frame(width: screenSize.width)
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
                            if videosD != nil{
                                Text("Videos")
                                    .bold()
                                    .padding([.horizontal, .top], screenSize.height*0.01)
                                VStack(alignment: .center){
                                    Picker(selection: $trailerChoice, label: Text("Seleccione un video")){
                                        ForEach(videosD.results, id: \.key){
                                            Text($0.name).tag($0.key)
                                        }
                                    }
                                    .onChange(of: trailerChoice){ choice in
                                        model.url = URL(string: "\(youtubelink)\(choice)")!
                                        model.loadUrl()
                                    }
                                    .frame(width: screenSize.width)
                                    if trailerChoice != "" {
                                        WebView(webView: model.webView)
                                            .frame(height: screenSize.height*0.3)
                                            .padding(.bottom, screenSize.height*0.01)
                                    }
                                }
                            }
                        }
                        .padding(.top, screenSize.height*0.12)
                    }
                }else{
                    Spacer()
                        .frame(height: screenSize.height*0.35)
                    LoadingView()
                }
            }
        }
        .onAppear(){
/*
            Codigo que recibe informacion de API
*/
            if userDefaults.string(forKey: "object") == "movie" {
                fetchMoviesById(){movie in
                    movieD = movie
                    releaseYear = String(self.movieD.release_date.split(separator: "-")[0])
                }
                fetchMovieVideo(){videos in
                    videosD = videos
                }
            }else if userDefaults.string(forKey: "object") == "serie" {
                fetchSerieById(){serie in
                    serieD = serie
                    releaseYear = String(self.serieD.first_air_date.split(separator: "-")[0])
                }
                fetchSeriesCrew(){crew in
                    serieCrew = crew
                }
            }
        }
    }
}

