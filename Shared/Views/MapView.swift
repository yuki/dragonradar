//
//  MapView.swift
//  dragonradar
//
//  Created by Rubén Gómez Olivencia on 17/5/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var game: Game

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Map{
                        ForEach(game.balls) { ball in
                            Annotation("", coordinate: ball.locationCoordinate) {
                                Image("d"+"\(ball.id)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 30)
                            }
                        }
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    #if os(iOS)
                    Image("marquee")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                        .allowsHitTesting(false)  // Esto permite que los toques pasen a través de la imagen
                    #endif
                }
            }
            .edgesIgnoringSafeArea(.all)

        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MapView(game: games[0])
}
