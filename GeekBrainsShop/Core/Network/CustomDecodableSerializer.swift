//
//  CustomDecodableSerializer.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 21.04.2022.
//

import Foundation
import Alamofire

/// Кастомный DecodableSerializer
final class CustomDecodableSerializer<T: Decodable>: DataResponseSerializerProtocol {
	typealias SerializedObject = T
	
	private let errorParser: AbstractErrorParser
	
	init(errorParser: AbstractErrorParser) {
		self.errorParser = errorParser
	}
	
	/// Парсит JSON и возвращает Decodable
	func serialize(request: URLRequest?, response: HTTPURLResponse?, data:
				   Data?, error: Error?) throws -> T {
		if let error = errorParser.parse(response: response, data: data, error:
											error) {
			throw error
		}
		
		do {
			let data = try DataResponseSerializer().serialize(request: request,
															  response: response, data: data, error: error)
			let value = try JSONDecoder().decode(T.self, from: data)
			return value
		} catch {
			let customError = errorParser.parse(error)
			throw customError
		}
	}
}
