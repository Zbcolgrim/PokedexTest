//
//  TableViewController.swift
//  PokedexTest
//
//  Created by Zachary Buffington on 9/7/21.
//

import UIKit

class TableViewController: UITableViewController {

    var manager = PokemonManager()
    var pokemon: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.fetchPokemon()
        

       
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pokemon.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath)
        
        cell.textLabel?.text = pokemon.name
        
        return cell
    }
    

   
}
extension TableViewController: PokemonManagerDelegate {
    func didFetchPokemon(pokemon: [Pokemon]) {
        DispatchQueue.main.async {
            self.pokemon = pokemon
            self.tableView.reloadData()
        }
    }
    
    func didFail(error: Error?) {
        print(error as Any)
    }

}
