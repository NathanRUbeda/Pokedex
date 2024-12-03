//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Nathan Ubeda on 11/13/24.
//

import Foundation

/// An object that is used to model data with home view.
@Observable
class PokemonViewModel {
	/// Array of Pokémon.
	var pokemon = [PokemonOverview]()
	
	/// An object that interacts with a cloud service to get Pokémon.
	var webService: PokemonProvider?
	
	/// An object that interacts with a cloud service to get Pokémon details.
	var detailWebService: PokemonDetailProvider?
	
	/// Whether the user's team is full (6 Pokémon) or not.
	var showFullTeamAlert = false
	
	init(
		webService: PokemonProvider,
		detailWebService: PokemonDetailProvider? = WebServiceFactory.shared.pokemonDetailProvider()
	) {
		self.webService = webService
		self.detailWebService = detailWebService
		
		self.fetchInitialPokemon()
	}
	
	/// Fetches Pokémon.
	/// - Returns: A `PokemonResponse` object.
	/// - Throws: A `NSError` if web wervice is absent.
	func fetchPokemon() async throws -> PokemonResponse {
		guard let webService else {
			throw NSError(domain: "PokemonViewModel", code: 0)
		}
		
		return try await webService.fetchPokemon()
	}
	
	/// Fetches Pokémon for initial list.
	func fetchInitialPokemon() {
		Task {
			do {
				let response = try await self.fetchPokemon()
				self.pokemon = response.results
			} catch {
				print(error)
			}
		}
	}
}
