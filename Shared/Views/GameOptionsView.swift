//
//  GameOptionsView.swift
//  dragonradar
//
//  Created by Rubén Gómez Olivencia on 14/5/24.
//

import SwiftUI

struct GameOptionsView: View {
    @State private var number: Int = 1
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Distancia de juego")
            HStack {
                Button(action: decrement) {
                    Image(systemName: "minus.circle")
                }
                .font(.largeTitle)
                .padding()

                Text("\(number) km")
                    .frame(width: 50)
                Button(action: increment) {
                    Image(systemName: "plus.circle")
                }
                .font(.largeTitle)
                .padding()
            }

            Button("Empezar") {
                presentationMode.wrappedValue.dismiss()
            }
            #if os(iOS)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            #endif
        }
        .padding()
    }
    
    func increment() {
        number += 1
    }

    func decrement() {
        if (number > 1){
            number -= 1
        }
    }
}

#Preview {
    GameOptionsView()
}
