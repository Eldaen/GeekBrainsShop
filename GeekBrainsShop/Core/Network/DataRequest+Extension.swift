//
//  DataRequest.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 21.04.2022.
//

import Foundation
import Alamofire

// MARK: - DataRequest extension
extension DataRequest {
	
	@discardableResult
	func responseCodable<T: Decodable>(errorParser: AbstractErrorParser,
									   queue: DispatchQueue = .main,
									   completionHandler: @escaping (AFDataResponse<T>) -> Void
	) -> Self {
		let responseSerializer = CustomDecodableSerializer<T>(errorParser: errorParser)
		return response(queue: queue,
						responseSerializer: responseSerializer,
						completionHandler: completionHandler
		)
	}
}
