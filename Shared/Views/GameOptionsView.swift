//
//  GameOptionsView.swift
//  dragonradar
//
//  Created by Rubén Gómez Olivencia on 14/5/24.
//

import SwiftUI
import SwiftData

struct GameOptionsView: View {
    @EnvironmentObject var locationManager: LocationManager
    @Environment(\.modelContext) var context
    @State private var gameDistance: Float = 1
    @State private var game: Game

    init(){
        let userLocation = LocationManager().location // else { return }
        let coordinates = Coordinates(latitude: userLocation?.coordinate.latitude ?? 43.2630529, longitude: userLocation?.coordinate.longitude ?? -2.9351349)
        game = Game(initialCoordinates: coordinates)
    }

    var body: some View {
        NavigationView {
            VStack {
                Text("Distancia de juego")
                HStack {
                    Button(action: decrement) {
                        Image(systemName: "minus.circle")
                    }
                    .font(.largeTitle)
                    .padding()

                    Text("\(gameDistance.formatted()) km")
                        .frame(width: 60)
                    Button(action: increment) {
                        Image(systemName: "plus.circle")
                    }
                    .font(.largeTitle)
                    .padding()
                }

                Button(action: {
                    game.distance = gameDistance
                    context.insert(game)
                }) {
                    NavigationLink(destination: MapView(game: game)) {
                        Text("Start")
                        #if os(iOS)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        #endif
                    }
                }
            }
        }
    }

    func increment() {
        gameDistance += 0.2
    }

    func decrement() {
        if (gameDistance > 0.4){
            gameDistance -= 0.2
        }
    }
}

#Preview {
    GameOptionsView()
}
