//
//  Sprite.swift
//  Pokedex
//
//  Created by Nathan Ubeda on 11/29/24.
//

import Foundation

/// An object that represents the sprites of a Pokémon.
struct Sprite: Codable, Hashable {
	/// Artwork url string of the default Pokémon's back.
	var backDefault: String
	
	/// Artwork url string of the default Pokémon's front.
	var frontDefault: String
	
	/// Other available sprites.
	var other: OtherSprite
	
	enum CodingKeys: String, CodingKey {
		case backDefault = "back_default"
		case frontDefault = "front_default"
		case other = "other"
	}
}
