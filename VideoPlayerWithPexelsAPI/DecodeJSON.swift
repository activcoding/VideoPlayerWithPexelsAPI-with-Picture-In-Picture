//
//  DecodeJSON.swift
//  VideoPlayerWithPexelsAPI
//
//  Created by Tommy Ludwig on 07.04.23.
//

import Foundation

/// The `preview` is only used to load the example `data.json`
/// So you can test and develop the UI without making an API call every time you change something
var preview: Videos = load("data.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Coun't find \(filename)")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Unresolved error \(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Unresolved error \(error)")
    }
}

