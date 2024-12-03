//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Nathan Ubeda on 11/13/24.
//

import SwiftData
import SwiftUI

@main
struct PokedexApp: App {
	let viewModel: PokemonViewModel
	
	init() {
		WebServiceFactory.shared.dispatcher = CoreWebServiceDispatcher()
		
		let pokemonWebService = WebServiceFactory.shared.pokemonProvider()
		let pokemonDetailService = WebServiceFactory.shared.pokemonDetailProvider()
		let viewModel = PokemonViewModel(
			webService: pokemonWebService,
			detailWebService: pokemonDetailService
		)
		self.viewModel = viewModel
		self.viewModel.fetchInitialPokemon()
	}
	
    var body: some Scene {
        WindowGroup {
			ContentView(viewModel: viewModel)
        }
		.modelContainer(for: PokemonTeamMember.self)
		
		WindowGroup(for: PokemonResponseObject.self) { responseObject in
			if let detailViewModel = PokemonDetailViewModel(
				from: responseObject
					.wrappedValue) {
				PokemonDetailView(
					viewModel: detailViewModel
				)
			}
		}
    }
}
