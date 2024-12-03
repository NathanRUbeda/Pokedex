//
//  OtherSprite.swift
//  Pokedex
//
//  Created by Nathan Ubeda on 11/29/24.
//

import Foundation

/// An object that represents the other sprites of a Pokémon.
struct OtherSprite: Codable, Hashable {
	/// Official artwork of the Pokémon.
	var officialArtwork: OfficialArtwork
	
	enum CodingKeys: String, CodingKey {
		case officialArtwork = "official-artwork"
	}
}

