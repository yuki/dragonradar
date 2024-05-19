//
//  MapView.swift
//  dragonradar
//
//  Created by Rubén Gómez Olivencia on 17/5/24.
//

import SwiftUI
import MapKit
import SwiftData

struct MapView: View {
    @Query(sort: \Game.start, order: .reverse) var games: [Game]
    @EnvironmentObject var locationManager: LocationManager
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Map(position: $position){
                        UserAnnotation()
                        ForEach(games[0].balls) { ball in
                            Annotation("", coordinate: ball.locationCoordinate) {
                                Image("d"+"\(ball.id)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 30)
                            }
                        }
                    }
                    .mapControls {
                        MapUserLocationButton()
                        MapCompass()
                            .mapControlVisibility(.visible)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    Image("marquee")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                        .allowsHitTesting(false)  // Esto permite que los toques pasen a través de la imagen
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
//        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MapView()
}
