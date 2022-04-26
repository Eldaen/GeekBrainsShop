//
//  AbstractRequestFactory.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 21.04.2022.
//

import Foundation
import Alamofire

/// Протокол создания запросов
protocol AbstractRequestFactory {
	
	/// Парсер ошибок
	var errorParser: AbstractErrorParser { get }
	
	/// Менеджер сессий
	var sessionManager: Session { get }
	
	/// Очередь, на которой выполнять запрос
	var queue: DispatchQueue { get }
	
	/// Создание запроса
	@discardableResult
	func request<T: Decodable>(
		request: URLRequestConvertible,
		completionHandler: @escaping (AFDataResponse<T>) -> Void)
	-> DataRequest
}

// MARK: - AbstractRequestFactory extension
extension AbstractRequestFactory {
	
	@discardableResult
	public func request<T: Decodable>(
		request: URLRequestConvertible,
		completionHandler: @escaping (AFDataResponse<T>) -> Void)
	-> DataRequest {
		return sessionManager
			.request(request)
			.responseCodable(errorParser: errorParser, queue: queue,
							 completionHandler: completionHandler)
	}
}
