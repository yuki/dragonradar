//
//  MapView.swift
//  dragonradar
//
//  Created by Rubén Gómez Olivencia on 13/5/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Map()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                Image("marquee")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
                    .allowsHitTesting(false)  // Esto permite que los toques pasen a través de la imagen
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    MapView()
}
