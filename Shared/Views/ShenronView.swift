//
//  ShenronView.swift
//  dragonradar
//
//  Created by Rubén Gómez Olivencia on 19/5/24.
//

import SwiftUI
import SwiftData

struct ShenronView: View {
    @State private var wishText: String = ""
    @State private var navigateToWishView = false
    @Environment(\.modelContext) var context
    @Query(sort: \Game.start, order: .reverse) var games: [Game]

    var body: some View {
        NavigationView {
            ZStack{
                Color.black
                VStack {
                    Image("shenron")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .padding(.bottom)

                    Text("Make your wish")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    #if os(iOS)
                    TextEditor(text: $wishText)
                        .padding(.all, 10)
                        .frame(height: 100)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.all, 40)
                    #endif
                    Button("Wish"){
                        games[0].wish = wishText
                        games[0].end = Date()
                        context.insert(games[0])
                    }
                    #if os(iOS)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    #endif
                }
            }
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    ShenronView()
}
