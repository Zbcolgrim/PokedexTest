//
//  Pokemon.swift
//  PokedexTest
//
//  Created by Zachary Buffington on 9/7/21.
//

import Foundation

struct PokemonAPIResponse: Codable {
    let results: [PokemonData]
}
struct PokemonData: Codable {
    let data: Pokemon
}
struct Pokemon: Codable {
    let name: String
}
