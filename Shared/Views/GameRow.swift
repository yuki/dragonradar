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
        GameRow(game: games[0])
        GameRow(game: games[1])
    }
}
