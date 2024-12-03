//
//  PokemonDetailService.swift
//  Pokedex
//
//  Created by Nathan Ubeda on 12/1/24.
//

import Foundation

/// A web service for handling detail networking operations.
class PokemonDetailService: WebService, PokemonDetailProvider {
	/// Sends request to get Pokémon based on its name.
	/// - Parameters:
	/// - name: The name of the Pokémon.
	/// - Returns: A `PokemonResponseObject` object.
	/// - Throws: A `NetworkError` if unable to build request or encountered during processing of request.
	func fetchSinglePokemon(name: String) async throws -> PokemonResponseObject {
		return try await self.dispatch(
			using: WebServiceRequest(
				httpMethod: "GET",
				endpoint: "pokemon/\(name)",
				headers: nil,
				queries: nil
			)
		)
	}
}
