//
//  ContentView.swift
//  dragonradar
//
//  Created by Rubén Gómez Olivencia on 13/5/24.
//

import SwiftUI
import CoreLocation
import SwiftData

struct ContentView: View {
    @EnvironmentObject var locationManager: LocationManager
    @Query(sort: \Game.start, order: .reverse) var games: [Game]

    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                Image("dragonradar")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 30.0)
                VStack {
                    if (games.count > 0 && games[0].start == games[0].end){
                        NavigationLink(destination: MapView(game: games[0])) {
                            Text("Continue Game")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                        }
                    } else {
                        NavigationLink(destination: GameOptionsView()) {
                            Text("New Game")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                    NavigationLink(destination: GamesList()) {
                        Text("Previous Games")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                    }
                }
            }
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    ContentView()
}
