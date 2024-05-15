//
//  Game.swift
//  dragonradar
//
//  Created by Rubén Gómez Olivencia on 14/5/24.
//

import Foundation
import CoreLocation
import SwiftData


struct Coordinates: Hashable, Codable  {
    var latitude: Double
    var longitude: Double
}

struct Ball: Hashable, Codable, Identifiable  {
    var id: Int
    var coordinates: Coordinates
    var found: Date
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
}



//@Model
struct Game: Hashable, Codable, Identifiable {
    @Attribute(.unique) var id: UUID
    var start: Date
    var end: Date
    var wish: String
    var balls: [Ball]
}
//    init(id: UUID, start: Date, end: Date, wish: String, balls: [Ball]) {
//        self.id = id
//        self.start = start
//        self.end = end
//        self.wish = wish
//        self.balls = balls
//    }
//}


