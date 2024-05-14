//
//  Game.swift
//  dragonradar
//
//  Created by Rubén Gómez Olivencia on 14/5/24.
//

import Foundation
import CoreLocation

struct Game: Hashable, Codable {
    var id: UUID
//    var start: Date
//    var end: Date
//    var wish: String
//    var balls: [Ball]


    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }

    struct Ball: Hashable, Codable {
        var coordinates: Coordinates
        var cathed: Date
        var locationCoordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(
                latitude: coordinates.latitude,
                longitude: coordinates.longitude)
        }
    }
}


