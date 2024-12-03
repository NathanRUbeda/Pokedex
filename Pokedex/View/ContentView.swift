//
//  ContentView.swift
//  Pokedex
//
//  Created by Nathan Ubeda on 11/13/24.
//

import SwiftUI

/// Displays a TabView with views for the Pokédex and the user's Pokémon team.
struct ContentView: View {
	let viewModel: PokemonViewModel
	
	var body: some View {
		TabView {
			Tab("Pokédex", systemImage: "circle.bottomhalf.filled.inverse") {
				PokedexView(viewModel: self.viewModel)
			}
			
			Tab("My Team", systemImage: "circle.grid.3x3") {
				TeamView()
			}
		}
		.tint(.red)
	}
}

