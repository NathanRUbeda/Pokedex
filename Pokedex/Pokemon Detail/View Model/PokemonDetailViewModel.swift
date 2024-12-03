//
//  PokemonDetailViewModel.swift
//  Pokedex
//
//  Created by Nathan Ubeda on 12/1/24.
//

import Foundation

/// An object that is used to model data with a Pokémon detail view.
@Observable
final class PokemonDetailViewModel {
	/// Height of the Pokémon.
	var height: Int?
	
	/// Name of the Pokémon.
	var name: String
	
	/// Pokédex order of the Pokémon.
	var order: Int?
	
	/// Sprites of the Pokémon.
	var sprites: Sprite?
	
	/// Types of the Pokémon.
	var types: [PokemonType]?
	
	/// Weight of the Pokémon.
	var weight: Int?
	
	/// An object that is used to build the view model.
	private(set) var serviceObject: PokemonResponseObject?
	
	/// An object that interacts with a cloud service.
	var webService: PokemonDetailProvider?
	
	/// Designated initializer.
	/// - Parameters:
	/// 	- name: The name of the Pokémon.
	/// 	- webService: The Pokémon detail provider to use for fetching detail data.
	init(
		for name: String,
		using webService: PokemonDetailProvider? = WebServiceFactory
			.shared.pokemonDetailProvider()
	) {
		self.name = name
		self.webService = webService
	}
	
	/// Instantiate a new view model from the given response object. If the reponse is `nil`, the initializer fails.
	init?(from response: PokemonResponseObject?) {
		guard let response else {
			return nil
		}
		
		self.serviceObject = response
		self.name = response.name
		self.webService = WebServiceFactory.shared.pokemonDetailProvider()
		if let serviceObject {
			self._update(from: serviceObject)
		}
	}
	
	/// Instantiate a new view model from the given pokemon team member.
	init(from pokemonTeamMember: PokemonTeamMember) {
		self.name = pokemonTeamMember.name
		self.height = pokemonTeamMember.height
		self.order = pokemonTeamMember.order
		self.sprites = .init(
			backDefault: pokemonTeamMember.frontImageURL,
			frontDefault: pokemonTeamMember.backImageURL,
			other: .init(
				officialArtwork: .init(
					frontDefault: pokemonTeamMember.otherImageURL
				)
			)
		)
		self.types = pokemonTeamMember.types
		self.weight = pokemonTeamMember.weight
	}
	
	/// Refreshes data by calling the network again.
	func refresh() async {
		await self.fetchPokemon(name: self.name)
	}
	
	/// Fetches Pokémon based on its name.
	private func fetchPokemon(name: String) async {
		do {
			let response = try await self.webService?.fetchSinglePokemon(name: name)
			self.serviceObject = response
			if let serviceObject {
				self._update(from: serviceObject)
			}
		} catch {
			print(error)
		}
	}
	
	/// Updates the values of the object.
	/// - Parameters:
	/// - serviceObject: 
	private func _update(from serviceObject: PokemonResponseObject) {
		self.height = serviceObject.height
		self.order = serviceObject.order
		self.sprites = serviceObject.sprites
		self.types = serviceObject.types
		self.weight = serviceObject.weight
	}
}
