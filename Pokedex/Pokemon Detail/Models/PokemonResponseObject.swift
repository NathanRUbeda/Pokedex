//
//  PokemonResponseObject.swift
//  Pokedex
//
//  Created by Nathan Ubeda on 12/1/24.
//

import Foundation

/// An object that represents a Pokémon.
struct PokemonResponseObject: Codable, Hashable {
	/// Height of the Pokémon.
	var height: Int
	
	/// Name of the Pokémon.
	var name: String
	
	/// Order of the Pokémon in the Pokédex.
	var order: Int
	
	/// Available sprites of the Pokémon.
	var sprites: Sprite
	
	/// Types of the Pokémon.
	var types: [PokemonType]
	
	/// Weight of the Pokémon.
	var weight: Int
	
	init(
		height: Int,
		name: String,
		order: Int,
		sprites: Sprite,
		types: [PokemonType],
		weight: Int
	) {
		self.height = height
		self.name = name
		self.order = order
		self.sprites = sprites
		self.types = types
		self.weight = weight
	}
}
