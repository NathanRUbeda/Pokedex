//
//  WebServiceRequest.swift
//  Pokedex
//
//  Created by Nathan Ubeda on 12/2/24.
//

import Foundation

/// An object that represents a web service request.
struct WebServiceRequest {
	let httpMethod: String
	let endpoint: String
	let headers: [String: Any]?
	let queries: [URLQueryItem]?
}
