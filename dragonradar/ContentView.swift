//
//  ContentView.swift
//  dragonradar
//
//  Created by Rubén Gómez Olivencia on 13/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showingPopover = false

    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                Image("dragonradar")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                VStack {
                    Button("New Game") {
                        showingPopover = true
                    }
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .popover(isPresented: $showingPopover) {
                        GameOptionsView()
                    }

                    NavigationLink(destination: GamesList()) {
                        Text("Previous Games")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                    }
                }
            }
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    ContentView()
}
