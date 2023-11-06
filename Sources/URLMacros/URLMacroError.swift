//
//  URLMacroError.swift
//
//
//  Created by Martin Svoboda on 31.10.2023.
//

import Foundation

enum URLMacroError: Error, CustomStringConvertible {
	case requiresStaticStringLiteral
	case malformedURL(urlString: String)

	var description: String {
		switch self {
		case .requiresStaticStringLiteral:
			return "#URL requires a static string literal"
		case .malformedURL(let urlString):
			return "The input URL is malformed: \(urlString)"
		}
	}
}
