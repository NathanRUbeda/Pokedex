//
//  OfficialArtwork.swift
//  Pokedex
//
//  Created by Nathan Ubeda on 11/29/24.
//

import Foundation

/// An object that represents the official artwork of a Pokémon.
struct OfficialArtwork: Codable, Hashable {
	/// Artwork of the default Pokémon's front.
	var frontDefault: String
	
	enum CodingKeys: String, CodingKey {
		case frontDefault = "front_default"
	}
}
