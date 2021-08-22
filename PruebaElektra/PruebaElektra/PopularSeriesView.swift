//  PopularSeriesView.swift
//  PruebaElektra
//  Created by Narciso Meza on 21/08/21.

import SwiftUI
import Kingfisher

struct PopularSeriesView: View {
    
    @State private var mostPopularSeries: APIResults!
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical){
                VStack{
                    if mostPopularSeries != nil{
                        ForEach(mostPopularSeries.results){movie in
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
                    fetchPopularSeries(){apiRes in
                        mostPopularSeries = apiRes
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) { // <3>
                    Text("Most Popular Series")
                }
            }
        }
    }
}

struct PopularSeriesView_Previews: PreviewProvider {
    static var previews: some View {
        PopularSeriesView()
    }
}
