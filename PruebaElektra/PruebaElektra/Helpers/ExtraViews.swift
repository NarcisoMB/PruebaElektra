//  ExtraViews.swift
//  PruebaElektra
//  Created by Narciso Meza on 21/08/21.
import SwiftUI

struct LoadingView: View {
    
    @State private var isLoading = false
    
    var body: some View {
        Circle()
            .trim(from: 0, to: 0.7)
            .stroke(Color.blue, lineWidth: 5)
            .frame(width: 100, height: 100)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
            .onAppear() {
                self.isLoading = true
            }
    }
}
