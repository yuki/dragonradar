//
//  GameDetail.swift
//  dragonradar
//
//  Created by Rubén Gómez Olivencia on 15/5/24.
//

import SwiftUI
import MapKit

struct GameDetail: View {
    var game: Game

    var body: some View {
        ScrollView {
            #if os(iOS)
            ZStack{
                Map {
                    ForEach(game.balls) { ball in
                        Annotation("", coordinate: ball.locationCoordinate) {
                            Image("d"+"\(ball.id)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 30)
                        }
                    }
                    //FIXME: CENTRAR EL MAPA con la posición inicial del juego
                }
                Image("marquee")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .allowsHitTesting(false)  // Esto permite que los toques pasen a través de la imagen
            }
            #endif
            VStack(alignment: .leading) {
                Text("Distance: \(game.distance.formatted())km")
                Text("Ended: \(game.end.formatted())")
                    .font(.title2)
                Divider()
                Text("Wish: " + game.wish)
                Divider()
                ForEach(game.balls) { ball in
                    HStack() {
                        Image("d"+"\(ball.id)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 50)
                        Text("\(ball.found?.formatted() ?? "")")
                    }
                }
            }
            .padding()
        }
        .navigationTitle(game.start.formatted())
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    GameRow(game: Game(initialCoordinates: Coordinates(latitude: 43.21, longitude: -2.91), distance: 1))
}
