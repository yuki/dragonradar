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

struct Ball: Hashable, Codable, Identifiable {
    var id: Int
    var coordinates: Coordinates
    var found: Date?
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
}


@Model
class Game: Hashable, Identifiable {
    @Attribute(.unique) var id: UUID
    var initialCoordinates: Coordinates
    var distance: Float //guardada en km
    var start: Date
    var end: Date
    var wish: String
    var balls: [Ball]
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: initialCoordinates.latitude,
            longitude: initialCoordinates.longitude)
    }


    init(initialCoordinates: Coordinates?, distance: Float) {
        let coordinate = LocationManager().location?.coordinate
        let startDate = Date()
        self.id = UUID()
        self.initialCoordinates = initialCoordinates ?? Coordinates(latitude: coordinate?.latitude ?? 43.2630529, longitude: coordinate?.longitude ?? -2.9351349)
        self.distance = distance
        self.start = startDate
        self.end = startDate
        self.wish = ""
        self.balls = []
        self.balls = generateBalls(initialCoordinates: self.initialCoordinates, distance: self.distance, count: 7)
    }

    private func generateBalls(initialCoordinates: Coordinates, distance: Float, count: Int) -> [Ball] {
        var balls = [Ball]()
        for i in 1..<count+1 {
            let randomCoordinates = generateRandomCoordinates(initialCoordinates: initialCoordinates, maxDistance: distance)
            let ball = Ball(id: i, coordinates: randomCoordinates)
            balls.append(ball)
        }
        return balls
    }

    private func generateRandomCoordinates(initialCoordinates: Coordinates, maxDistance: Float) -> Coordinates {
        // Genera un ángulo aleatorio en radianes
        let angle = Double.random(in: 0..<2 * .pi)

        // Genera una distancia aleatoria entre 0 y maxDistance en metros
        let distance = Double.random(in: 0..<Double(maxDistance*1000))

        // Calcula las nuevas coordenadas
        let earthRadius = 6371000.0 // Radio de la Tierra en metros
        let deltaLatitude = distance * cos(angle) / earthRadius
        let deltaLongitude = distance * sin(angle) / (earthRadius * cos(initialCoordinates.latitude * .pi / 180))

        let newLatitude = initialCoordinates.latitude + deltaLatitude * 180 / .pi
        let newLongitude = initialCoordinates.longitude + deltaLongitude * 180 / .pi

        return Coordinates(latitude: newLatitude, longitude: newLongitude)
    }
}
