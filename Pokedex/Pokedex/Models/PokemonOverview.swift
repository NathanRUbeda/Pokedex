//
//  PokemonOverview.swift
//  Pokedex
//
//  Created by Nathan Ubeda on 11/29/24.
//

import Foundation

/// An object that represents an overview of  a Pokémon.
struct PokemonOverview: Codable, Hashable {
	/// Name of the Pokémon.
	let name: String
	
	/// URL of the Pokémon's icon.
	let url: String
}
