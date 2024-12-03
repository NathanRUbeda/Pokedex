//
//  PokemonTeamMember.swift
//  Pokedex
//
//  Created by Nathan Ubeda on 11/13/24.
//

import Foundation
import SwiftData

/// An object that represents a Pokémon.
@Model
class PokemonTeamMember {
	/// Height of the Pokémon.
	var height: Int
	
	/// Name of the Pokémon.
	var name: String
	
	/// Order of the Pokémon in the Pokédex.
	var order: Int
	
	/// URL for the front image of the Pokémon.
	var frontImageURL: String
	
	/// URL for the back image of the Pokémon.
	var backImageURL: String
	
	/// URL for the other images of the Pokémon.
	var otherImageURL: String
	
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
		self.frontImageURL = sprites.frontDefault
		self.backImageURL = sprites.backDefault
		self.otherImageURL = sprites.other.officialArtwork.frontDefault
		self.types = types
		self.weight = weight
	}
}
