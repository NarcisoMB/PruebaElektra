//  PopularMoviesView.swift
//  PruebaElektra
//  Created by Narciso Meza on 21/08/21.
import SwiftUI
import Kingfisher

struct PopularMoviesView: View {
    
    @State private var mostPopularMovies: APIResults!
    
    var body: some View {
        ScrollView(.vertical){
            VStack{
                Text("Most Popular Movies")
                if mostPopularMovies != nil{
                    ForEach(mostPopularMovies.results){movie in
                        KFImage(URL(string: imagesURL + movie.backdrop_path))
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.3, alignment: .center)
                        Text("\(movie.title)")
                    }
                }else{
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

struct PopularMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        PopularMoviesView()
    }
}
