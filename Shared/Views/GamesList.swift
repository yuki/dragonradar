//
//  GamesView.swift
//  dragonradar
//
//  Created by Rubén Gómez Olivencia on 14/5/24.
//

import SwiftUI
import SwiftData

struct GamesList: View {
    @Query(sort: \Game.start, order: .reverse) var games: [Game]
    @State private var isShowingSheet = false

    var body: some View {
        List(games) { game in
            NavigationLink {
                GameDetail(game: game)
            } label: {
                GameRow(game: game)
            }
        }.navigationTitle("Previous Games")
        .toolbar {
            if games.isEmpty {
                Text("Empty")
            }
        }
        .overlay {
            if games.isEmpty {
                ContentUnavailableView(label: {
                    Label("No Dragon Ball", image: "d4")
                }, description: {
                    Text("No previous games.")
                }, actions: {
                    Button("Start game") { isShowingSheet = true }
                })
                .offset(y: -70)
            }
        }
    }
}

#Preview {
    GamesList()
}
