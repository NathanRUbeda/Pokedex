//
//  PokedexView.swift
//  Pokedex
//
//  Created by Nathan Ubeda on 11/14/24.
//

import SwiftUI

/// Displays a NavigationStack with a ScrollView containg all the Pokémon.
struct PokedexView: View {
	let viewModel: PokemonViewModel
	
	var body: some View {
		NavigationStack {
			ScrollView {
				VStack(alignment: .leading) {
					self.pokemonForEach
				}
			}
			.navigationTitle("Pokédex")
		}
		.scrollIndicators(.hidden)
		.padding()
	}
	
	/// Displays a ForEach of Pokémon.
	private var pokemonForEach: some View {
		ForEach(
			Array(viewModel.pokemon.enumerated()),
			id: \.element
		) { index, pokemon in
			NavigationLink {
				PokemonDetailView(
					viewModel: .init(
						for: pokemon.name,
						using: self.viewModel.detailWebService
					)
				)
			} label: {
				HStack {
					Image("pokeball")
						.resizable()
						.frame(width: 20, height: 20)
					
					Text("No\(index + 1)")
					
					Text(pokemon.name.uppercased())
				}
				.padding(.bottom)
			}
			.buttonStyle(.plain)
		}
	}
}


