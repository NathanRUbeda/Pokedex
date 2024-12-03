//
//  PokemonDetailProvider.swift
//  Pokedex
//
//  Created by Nathan Ubeda on 12/1/24.
//

import Foundation

/// An object that provides Pokémon detail data.
protocol PokemonDetailProvider {
	/// Sends request to get a single Pokémon based on its name.
	/// - Returns: An `PokemonResponseObject` object.
	/// - Throws: A `NetworkError` if unable to build request or encountered during processing of request.
	func fetchSinglePokemon(name: String) async throws -> PokemonResponseObject
}
