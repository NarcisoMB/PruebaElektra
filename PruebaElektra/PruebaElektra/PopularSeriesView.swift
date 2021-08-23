//  PopularSeriesView.swift
//  PruebaElektra
//  Created by Narciso Meza on 21/08/21.

import SwiftUI
import Kingfisher

struct PopularSeriesView: View {
    
    @State private var mostPopularSeries: SerieResults!
    
    var body: some View {
        ScrollView(.vertical){
            if mostPopularSeries != nil{
                HStack{
                    VStack{
                        ForEach(mostPopularSeries.results.split().left){serie in
                            Button(action: {
                                print("\(serie.name)")
                            }){
                                ZStack{
                                    KFImage(URL(string: imagesURL + serie.poster_path))
                                        .resizable()
                                        .frame(width: UIScreen.main.bounds.width*0.4, height: UIScreen.main.bounds.height*0.25, alignment: .center)
                                    VStack{
                                        Spacer()
                                        Text("\(serie.name)")
                                            .font(.title2)
                                            .padding(.bottom, 6)
                                            .background(
                                                Color.gray
                                                    .opacity(0.5)
                                                    .frame(width: UIScreen.main.bounds.width*0.4)
                                            )
                                            .frame(width: UIScreen.main.bounds.width*0.4)
                                    }
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.leading, UIScreen.main.bounds.width*0.06)
                    VStack{
                        ForEach(mostPopularSeries.results.split().right){serie in
                            Button(action: {
                                print("\(serie.name)")
                            }){
                                ZStack{
                                    KFImage(URL(string: imagesURL + serie.poster_path))
                                        .resizable()
                                        .frame(width: UIScreen.main.bounds.width*0.4, height: UIScreen.main.bounds.height*0.25, alignment: .center)
                                    VStack{
                                        Spacer()
                                        Text("\(serie.name)")
                                            .font(.title2)
                                            .padding(.bottom, 6)
                                            .background(
                                                Color.gray
                                                    .opacity(0.5)
                                                    .frame(width: UIScreen.main.bounds.width*0.4)
                                            )
                                            .frame(width: UIScreen.main.bounds.width*0.4)
                                    }
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal, UIScreen.main.bounds.width*0.06)
                }
            }else{
                Spacer()
                    .frame(height: UIScreen.main.bounds.height*0.35)
                LoadingView()
            }
        }
        .onAppear(){
            fetchPopularSeries(){apiRes in
                mostPopularSeries = apiRes
            }
        }
    }
}

struct PopularSeriesView_Previews: PreviewProvider {
    static var previews: some View {
        PopularSeriesView()
    }
}
