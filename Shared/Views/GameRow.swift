//
//  GameRow.swift
//  dragonradar
//
//  Created by Rubén Gómez Olivencia on 15/5/24.
//

import SwiftUI

struct GameRow: View {
    var game: Game

    var body: some View {
        HStack {
            Text("\(game.start.formatted())").frame(height: 40)
            Spacer()
        }
    }
}

#Preview {
    Group {
        GameRow(game: Game(initialCoordinates: Coordinates(latitude: 43.21, longitude: -2.91), distance: 1))
//        GameRow(game: Game(distance: 2))
    }
}
