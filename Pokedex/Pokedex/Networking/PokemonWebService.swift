//
//  PokemonWebService.swift
//  Pokedex
//
//  Created by Nathan Ubeda on 11/13/24.
//

import Foundation

/// A web service for handling networking for the pokédex.
class PokemonWebService: WebService, PokemonProvider {
	/// Sends request to get Pokémon.
	/// - Returns: A `PokemonResponse` object.
	/// - Throws: A `NetworkError` if unable to build request or encountered during processing of request.
	func fetchPokemon() async throws -> PokemonResponse {
		return try await self.dispatch(
			using: WebServiceRequest(
				httpMethod: "GET",
				endpoint: "pokemon",
				headers: nil,
				queries: [
					URLQueryItem(name: "limit", value: "151")
				]
			)
		)
	}
}
