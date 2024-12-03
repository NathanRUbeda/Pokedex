//
//  WebServiceDispatcher.swift
//  Pokedex
//
//  Created by Nathan Ubeda on 12/2/24.
//

import Foundation

/// An object that acts as a dispatcher for requests made.
protocol WebServiceDispatcher {
	/// Dispatches data utilizing a `WebServiceRequest`.
	/// - Parameters:
	/// -  request: A `WebServiceRequest` containing the request settings.
	/// - Throws: An error if the URL can't be built or if encountered or returned when sending the URL request.
	/// - Returns: The value returned from the URL decoded to the specified type.
	func dispatch<T: Decodable>(using request: WebServiceRequest) async throws -> T
}
