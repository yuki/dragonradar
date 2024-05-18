//
//  ModelData.swift
//  dragonradar
//
//  Created by Rubén Gómez Olivencia on 15/5/24.
//

import Foundation


// FIXME: TEMPORAL
struct Game2: Hashable, Decodable, Identifiable {
    var id: UUID
    var start: Date
    var end: Date
    var wish: String
    var balls: [Ball]
}

var games: [Game2] = load("games.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
