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



@Model
class Game: Hashable, Identifiable {
    @Attribute(.unique) var id: UUID
    var initial_coordinates: Coordinates
    // TODO: distance Int or Float to be 0,5...?
    var distance: Int
    var start: Date
    var end: Date
    var wish: String
//    var balls: [Ball]

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: initial_coordinates.latitude,
            longitude: initial_coordinates.longitude)
    }

    init(id: UUID, initial_coordinates: Coordinates, distance: Int ,start: Date, end: Date, wish: String) {
        self.id = id
        self.initial_coordinates = initial_coordinates
        self.distance = distance
        self.start = start
        self.end = end
        self.wish = wish
//        self.balls = balls
    }

    func create() -> Game{
        return Game.init(
            id: UUID(),
            initial_coordinates: Coordinates(latitude: 43.21, longitude: -2.9388382),
            distance: 1,
            start: Date(),
            end: Date(),
            wish: ""
//            balls: [Ball]
        )
//        game.id = UUID()
//        return game
    }
}
