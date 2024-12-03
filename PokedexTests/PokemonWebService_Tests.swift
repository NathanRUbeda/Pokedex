//
//  PokemonWebService_Tests.swift
//  PokedexTests
//
//  Created by Nathan Ubeda on 11/30/24.
//

import XCTest
@testable import Pokedex

final class PokemonWebService_Tests: XCTestCase {
	var webService: PokemonProvider?
	
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
		webService = nil
    }
	
	func test_WebService_fetchPokemon_shouldFetchPokedex() async throws {
		// Given
		let webService = WebServiceFactory.shared.pokemonProvider()
		
		// When
		let response = try await webService.fetchPokemon()
		
		// Then
		XCTAssertNotNil(response)
	}
	
	func test_WebService_fetchSinglePokemon_shouldFetchSpecificPokemon() async throws {
		// Given
		let webService = WebServiceFactory.shared.pokemonDetailProvider()
		
		// When
		let names = ["alakazam", "lapras", "mudkip"]
		
		// Then
		for name in names {
			let response = try await webService.fetchSinglePokemon(name: name)
			XCTAssertNotNil(response)
		}
	}
}

 


