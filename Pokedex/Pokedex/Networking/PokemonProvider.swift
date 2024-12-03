//
//  PokemonProvider.swift
//  Pokedex
//
//  Created by Nathan Ubeda on 11/13/24.
//

import Foundation

/// An object that provides Pokémon.
protocol PokemonProvider {
	/// Sends request to get Pokémon.
	/// - Returns: A `PokemonResponse` object.
	/// - Throws: A `NetworkError` if unable to build request or encountered during processing of request.
	func fetchPokemon() async throws -> PokemonResponse
}
