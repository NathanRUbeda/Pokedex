//
//  Type.swift
//  Pokedex
//
//  Created by Nathan Ubeda on 11/29/24.
//

import Foundation

/// An object that represents the types of a Pokémon.
struct PokemonType: Codable, Hashable {
	/// Slot of the type.
	var slot: Int
	
	/// Type of the Pokémon.
	var type: TypeDetail
}
