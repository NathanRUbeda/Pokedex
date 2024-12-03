//
//  MockWebService.swift
//  PokedexTests
//
//  Created by Nathan Ubeda on 11/30/24.
//

import Foundation
@testable import Pokedex

/// An object that mimics an interaction with a cloud service using a JSON file.
class MockWebService: WebService, PokemonProvider {
	/// Sends request to get Pokémon.
	/// - Returns: A `PokemonResponse` object.
	/// - Throws: A `NetworkError` if unable to build request or encountered during processing of request.
	func fetchPokemon() async throws -> Pokedex.PokemonResponse {
		guard let jsonURL = Bundle.main.url(forResource: "mockPokedexJSON", withExtension: "json") else {
			throw NetworkError.missingJSON
		}
		
		guard let data = try? Data(contentsOf: jsonURL) else {
			throw NetworkError.loadingError
		}
		
		return try decode(data)
	}

	/// Sends request to get Pokémon based on its name.
	/// - Parameters:
	/// - name: The name of the Pokémon.
	/// - Returns: A `PokemonResponseObject` object.
	/// - Throws: A `NetworkError` if unable to build request or encountered during processing of request.
	func fetchSinglePokemon(name: String) async throws -> Pokedex.PokemonResponseObject {
		let url: URL? = switch name {
			case "alakazam":
				Bundle.main.url(forResource: "mockAlakazamJSON", withExtension: "json")
			case "lapras":
				Bundle.main.url(forResource: "mockLaprasJSON", withExtension: "json")
			case "mudkip":
				Bundle.main.url(forResource: "mockMudkipJSON", withExtension: "json")
			default:
				nil
		}
		
		guard let jsonURL = url else {
			throw NetworkError.missingJSON
		}
		
		guard let data = try? Data(contentsOf: jsonURL) else {
			throw NetworkError.loadingError
		}
		
		return try decode(data)
	}
}
