//  MoviesView.swift
//  PruebaElektra
//  Created by Narciso Meza on 21/08/21.
import SwiftUI

struct MoviesView: View {
    var body: some View {
        VStack{
            Text("Hellow")
        }
        .onAppear(){
            fetchPopularMovies()
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
