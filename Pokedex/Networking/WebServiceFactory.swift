//
//  WebServiceFactory.swift
//  Pokedex
//
//  Created by Nathan Ubeda on 12/1/24.
//

import Foundation

/// An object to vend web services.
class WebServiceFactory {
	/// The dispatcher to use for networking.
	var dispatcher: WebServiceDispatcher!
	
	/// A shared instance of the factory to vend web services.
	static let shared = WebServiceFactory()
	
	/// A method that returns a PokemonProvider.
	/// - Returns: A `PokemonProvider` object.
	func pokemonProvider() -> PokemonProvider {
		PokemonWebService(dispatcher: self.dispatcher)
	}
	
	/// A method that returns a PokemonDetailProvider.
	/// - Returns: A `PokemonDetailProvider` object.
	func pokemonDetailProvider() -> PokemonDetailProvider {
		PokemonDetailService(dispatcher: self.dispatcher)
	}
}
