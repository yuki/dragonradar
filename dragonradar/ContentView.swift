//
//  ContentView.swift
//  dragonradar
//
//  Created by Rubén Gómez Olivencia on 13/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            //Image("backgroundsvg")
            //    .resizable()
            //    .aspectRatio(contentMode: .fill)
            Image("dragonradar")
            //    .resizable(resizingMode: .stretch)
            //    .aspectRatio(contentMode: .fit)
            VStack(spacing: 25.0) {
                Text("New Game")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text("Previous Games")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
            }
        }.background(Color.black)
    }
}

#Preview {
    ContentView()
}
