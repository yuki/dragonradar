//
//  ContentView.swift
//  dragonradar Watch App
//
//  Created by Rubén Gómez Olivencia on 13/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("backgroundsvg")
                VStack {
                    NavigationLink(destination: GameOptionsView()) {
                        Text("New Game")
                            .bold()
                    }
                    NavigationLink(destination: GamesList()) {
                        Text("Previous Games")
                            .bold()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
