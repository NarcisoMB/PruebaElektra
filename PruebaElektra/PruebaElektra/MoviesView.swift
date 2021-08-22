//  MoviesView.swift
//  PruebaElektra
//  Created by Narciso Meza on 21/08/21.
import SwiftUI

struct MoviesView: View {
    
    @State private var apiResults: APIResults!
    
    var body: some View {
        VStack{
            Text("Movies")
            
        }
        .onAppear(){
            fetchPopularMovies(){apiRes in 
                apiResults = apiRes
            }
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
