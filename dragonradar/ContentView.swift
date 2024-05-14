//
//  ContentView.swift
//  dragonradar
//
//  Created by Rubén Gómez Olivencia on 13/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                Image("dragonradar")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                VStack {
                    NavigationLink(destination: GameOptionsView()) {
                        Text("New Game")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                    }
                    NavigationLink(destination: ListGamesView()) {
                        Text("Previous Games")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                    }
                }
            }.background(Color.black)
        }
    }
}

#Preview {
    ContentView()
}
