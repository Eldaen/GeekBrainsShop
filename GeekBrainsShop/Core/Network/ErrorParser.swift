//
//  ErrorParser.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 21.04.2022.
//

import Foundation

/// Парсер ошибок
final class ErrorParser: AbstractErrorParser {
	func parse(_ result: Error) -> Error {
		return result
	}
	
	func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
		return error
	}
}
