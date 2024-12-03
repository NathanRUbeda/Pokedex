//
//  TeamView.swift
//  Pokedex
//
//  Created by Nathan Ubeda on 11/14/24.
//

import SwiftData
import SwiftUI

/// Displays a NavigationStack with a ScrollView to show all the Pokémon selected for the user's team.
struct TeamView: View {
	@Query var pokemonTeam: [PokemonTeamMember]
	
	var body: some View {
		NavigationStack {
			ScrollView {
				VStack {
					if !self.pokemonTeam.isEmpty {
						self.pokemonTeamForEach
					} else {
						self.emptyTeamText
					}
				}
				.padding()
				.navigationTitle("My Team")
			}
		}
	}
	
	/// Displays a ForEach of NavigationLinks labeled as an HStack that contains a Pokémon's image and name text.
	private var pokemonTeamForEach: some View {
		ForEach(self.pokemonTeam, id: \.self) { pokemon in
			NavigationLink {
				PokemonDetailView(
					viewModel: .init(from: pokemon)
				)
			} label: {
				HStack {
					AsyncImage(
						url: URL(
							string: pokemon.frontImageURL
						)
					) { phase in
						if let image = phase.image {
							image
								.resizable()
								.scaledToFit()
								.frame(width: 100, height: 100)
						} else if phase.error != nil {
							self.errorView
						} else {
							self.loadingView
						}
					}
					
					Text(pokemon.name.capitalized)
						.foregroundStyle(.white)
					
					Spacer()
				}
				.frame(maxWidth: .infinity)
				.background(.teal)
				.clipShape(RoundedRectangle(cornerRadius: 8))
			}
			.buttonStyle(.plain)
		}
	}
	
	/// Displays a text indicating an error.
	private var errorView: some View {
		Text("Error")
			.frame(width: 100, height: 100)
	}
	
	/// Displays a ProgressView.
	private var loadingView: some View {
		ProgressView()
			.frame(width: 100, height: 100)
	}
	
	/// Displays a text indicating the user's team is empty.
	private var emptyTeamText: some View {
		Text("No pokemon on your team.")
	}
}
