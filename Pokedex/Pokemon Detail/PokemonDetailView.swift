//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Nathan Ubeda on 11/13/24.
//

import SwiftData
import SwiftUI

/// Displays a scrollable VStack containing detailed information about the Pokémon, such as name, sprites, and types.
struct PokemonDetailView: View {
	@Environment(\.openWindow) var openWindow
	@Environment(\.modelContext) var modelContext
	@Query var pokemonTeam: [PokemonTeamMember]
	
	@Bindable var viewModel: PokemonDetailViewModel
	
	var isSelected: Bool {
		self.pokemonTeam.contains(where: { $0.name == self.viewModel.name })
	}
	
	let rows = [
		GridItem(.adaptive(minimum: 170))
	]
	
	@State private var showFullTeamAlert = false
	
	var body: some View {
		ScrollView {
			VStack {
				self.nameAndOrderSection
				
				if let sprites = viewModel.sprites {
					AsyncImage(
						url: URL(
							string: sprites.other.officialArtwork.frontDefault)
					) { phase in
						if let image = phase.image {
							image
								.resizable()
								.scaledToFit()
								.frame(width: 360, height: 360)
								.background(Color(#colorLiteral(red: 0.9531050324, green: 0.9531050324, blue: 0.9531050324, alpha: 1)))
						} else if phase.error != nil {
							Text("Loading Error")
								.frame(width: 400, height: 400)
						} else {
							ProgressView()
								.frame(width: 400, height: 400)
						}
					}
				}
				
				if let height = viewModel.height, let weight = viewModel.weight {
					VStack {
						Text("Height")
							.foregroundStyle(.white)
							.padding(.top, 18)
						
						Text("\(height)''")
							.padding(.bottom, 18)
						
						Text("Weight")
							.foregroundStyle(.white)
						
						Text("\(weight) lbs")
							.padding(.bottom, 18)
					}
					.frame(maxWidth: .infinity)
					.background(.teal)
					.clipShape(RoundedRectangle(cornerRadius: 12))
					.padding([.bottom, .horizontal])
				}
				
				
				if let types = viewModel.types {
					Text("Type")
					LazyHGrid(rows: rows) {
						ForEach(types, id: \.self) { element in
							Text(element.type.name.capitalized)
								.frame(width: 170, height: 30)
								.background {
									_getTypeColor(type: element.type.name)
								}
								.clipShape(RoundedRectangle(cornerRadius: 4))
						}
					}
				}
			}
		}
		.scrollIndicators(.hidden)
		.task {
			await self.viewModel.refresh()
		}
		.toolbar {
			ToolbarItem(placement: .navigation) {
				self.addToTeamButton
			}
			#if os(macOS)
			ToolbarItem {
				self.openButton
			}
			#endif
		}
		.alert("Your team is full!", isPresented: self.$showFullTeamAlert) {
			Button("Got it!", role: .cancel) { }
		} message: {
			Text("Teams are limited to only 6 Pokémon.")
		}
	}
	
	/// Displays an HStack with texts for the name and order of the Pokémon.
	private var nameAndOrderSection: some View {
		HStack {
			Text(self.viewModel.name.capitalized)
			if let order = viewModel.order {
				Text("#\(order)")
					.foregroundStyle(.gray)
			}
		}
		.font(.title)
		.fontWeight(.regular)
	}
	
	/// Displays a button labeled as a star icon image.
	private var addToTeamButton: some View {
		Button {
			self._addToTeam()
		} label: {
			Image(
				systemName: self.isSelected ? "star.fill" : "star"
			)
		}
	}
	
	/// Displays a button labeled as a "Open" text.
	private var openButton: some View {
		Button {
			if let serviceObject = viewModel.serviceObject {
				self.openWindow(value: serviceObject)
			}
		} label: {
			Text("Open")
		}
	}
	
	/// Provides a Color based on a type name.
	/// - Parameters:
	/// - type: The name of the Pokémon's type.
	/// - Returns: A `PokemonResponse` object.
	private func _getTypeColor(type: String) -> Color {
		switch type {
			case "normal": return Color.gray
			case "fighting": return Color.brown
			case "flying": return Color.cyan
			case "poison": return Color.indigo
			case "ground": return Color.yellow
			case "rock": return Color.brown
			case "bug": return Color.green
			case "ghost": return Color.purple
			case "steel": return Color.gray
			case "fire": return Color.orange
			case "water": return Color.blue
			case "grass": return Color.green
			case "electric": return Color.yellow
			case "psychic": return Color.pink
			case "ice": return Color.cyan
			case "dragon": return Color.teal
			case "dark": return Color.black
			case "fairy": return Color.pink
			case "stellar": return Color.clear
			case "unknown": return Color.mint
			default: return Color.clear
		}
	}
	
	/// Adds Pokémon to team's modelContext (limit of 6). If Pokémon is already part of the team, it gets removed.
	private func _addToTeam() {
		if let existingPokemon = self.pokemonTeam.first(where: { $0.name == self.viewModel.name }) {
			self.modelContext.delete(existingPokemon)
		} else {
			guard self.pokemonTeam.count < 6 else {
				self.showFullTeamAlert = true
				return
			}
			
			guard let height = viewModel.height, let order = viewModel.order, let sprites = viewModel.sprites, let types = viewModel.types, let weight = viewModel.weight else {
				return
			}
						
			let newPokemonTeamMember = PokemonTeamMember(
				height: height,
				name: self.viewModel.name,
				order: order,
				sprites: sprites,
				types: types,
				weight: weight
			)
			self.modelContext.insert(newPokemonTeamMember)
			do {
				try self.modelContext.save()
			} catch {
				print("An error when saving: \(error)")
			}
		}
	}
}

