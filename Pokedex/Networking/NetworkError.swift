//
//  NetworkError.swift
//  Pokedex
//
//  Created by Nathan Ubeda on 12/2/24.
//

import Foundation

/// Enum for possible network errors.
enum NetworkError: Error {
	case invalidURL
	case missingJSON
	case loadingError
}
