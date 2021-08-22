//  AiringMovies.swift
//  PruebaElektra
//  Created by Narciso Meza on 21/08/21.
import SwiftUI
import Kingfisher

struct AiringMovies: View {
    
    @State private var playingNowMovies: APIResults!
    
    var body: some View {
        ScrollView(.vertical){
            VStack{
                Text("Playing Now Movies")
                if playingNowMovies != nil{
                    ForEach(playingNowMovies.results){movie in
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
                fetchPlayingNowMovies(){apiRes in
                    playingNowMovies = apiRes
                }
            }
        }
    }
}

struct AiringMovies_Previews: PreviewProvider {
    static var previews: some View {
        AiringMovies()
    }
}
