//
//  TypeDetail.swift
//  Pokedex
//
//  Created by Nathan Ubeda on 11/29/24.
//

import Foundation

/// An object that represents the type of a Pokémon.
struct TypeDetail: Codable, Hashable {
	/// Name of the type.
	var name: String
	
	/// URL of the type.
	var url: String
}

