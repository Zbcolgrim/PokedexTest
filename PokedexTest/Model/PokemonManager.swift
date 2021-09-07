//
//  PokemonManager.swift
//  PokedexTest
//
//  Created by Zachary Buffington on 9/7/21.
//

import Foundation

protocol PokemonManagerDelegate {
    func didFetchPokemon(pokemon: [Pokemon])
    func didFail(error: Error?)
}

struct PokemonManager {
    
    var delegate: PokemonManagerDelegate?
    
    func fetchPokemon() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=151") else {
            delegate?.didFail(error: nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                delegate?.didFail(error: error)
                return
            }
            guard let data = data else {
                delegate?.didFail(error: nil)
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let response = try decoder.decode(PokemonAPIResponse.self, from: data)
                let pokemon = response.results.map { $0.data }
                delegate?.didFetchPokemon(pokemon: pokemon)
                
                
            } catch {
                delegate?.didFail(error: error)
                return
            }
        }.resume()
    }
    
}
