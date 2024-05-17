//
//  ContentView.swift
//  dragonradar
//
//  Created by Rubén Gómez Olivencia on 13/5/24.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @EnvironmentObject var locationManager: LocationManager

    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                Image("dragonradar")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 30.0)
                VStack {
                    NavigationLink(destination: GameOptionsView()) {
                        Text("New Game")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
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
