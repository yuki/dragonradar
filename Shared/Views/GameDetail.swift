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
            Map {
                ForEach(game.balls) { ball in
                    Annotation("", coordinate: ball.locationCoordinate) {
                        Image("d"+"\(ball.id)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 30)
                    }
                }
            }.frame(height: 300)
            
            #endif
            VStack(alignment: .leading) {
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
                        Text("\(ball.found.formatted())")
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
    GameDetail(game: games[0])
}
