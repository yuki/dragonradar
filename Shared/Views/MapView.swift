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
    @State var game: Game
    @EnvironmentObject var locationManager: LocationManager
    @Environment(\.modelContext) var context
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var showAlert: [Bool] = [false,false,false,false,false,false,false,]

    var body: some View {
        NavigationView {
            if game.isFinished() {
                ShenronView()
            } else {
                GeometryReader { geometry in
                    ZStack {
                        Map(position: $position){
                            UserAnnotation()
                            ForEach(game.balls) { ball in
                                if ball.found == nil {
                                    Annotation("", coordinate: ball.locationCoordinate) {
                                        Image("d"+"\(ball.id)")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: 30)
                                            .onLongPressGesture {
                                                showAlert[ball.id-1] = true
                                            }
                                            .alert(isPresented: $showAlert[ball.id-1]) {
                                                Alert(
                                                    title: Text("Catch the ball?"),
                                                    message: Text("Distance \(game.ballDistance(userLocation: locationManager.location, ball: ball).formatted())"),
                                                    dismissButton: .cancel(
                                                        Text("Catch!"),
                                                        action: {
                                                            game.balls[ball.id-1].found = Date()
                                                            context.insert(game)
                                                        }
                                                    )
                                                )
                                            }
                                    }
                                }
                            }
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
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MapView(game: Game(initialCoordinates: Coordinates(latitude: 43.21, longitude: -2.91)))
}
