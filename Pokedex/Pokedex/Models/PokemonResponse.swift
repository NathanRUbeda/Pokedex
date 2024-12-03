//
//  PokemonResponse.swift
//  Pokedex
//
//  Created by Nathan Ubeda on 11/30/24.
//

import Foundation

/// An object that represents an array of Pokémon.
struct PokemonResponse: Codable {
	/// Results of the API call.
	let results: [PokemonOverview]
}
