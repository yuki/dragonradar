//
//  GamesView.swift
//  dragonradar
//
//  Created by Rubén Gómez Olivencia on 14/5/24.
//

import SwiftUI

struct GamesList: View {
    var body: some View {
        List(games) { game in
            NavigationLink {
                GameDetail(game: game)
            } label: {
                GameRow(game: game)
            }
        }.navigationTitle("Previous Games")
    }
}

#Preview {
    GamesList()
}
