//
//  RequestFactory.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 21.04.2022.
//

import Foundation
import Alamofire

/// Фабрика запросов в сеть
final class RequestFactory {
	
	/// Cтандартная очередь
	let sessionQueue = DispatchQueue.global(qos: .utility)
	
	/// Стандартная сессия
	lazy var commonSession: Session = {
		let configuration = URLSessionConfiguration.default
		configuration.httpShouldSetCookies = false
		configuration.headers = .default
		let manager = Session(configuration: configuration)
		return manager
	}()
	
	/// Возвращает обработчик ошибок
	func makeErrorParser() -> AbstractErrorParser {
		return ErrorParser()
	}
	
	/// Возвращает запрос к авторизации
	func makeAuthRequestFatory() -> AuthRequestFactory {
		let errorParser = makeErrorParser()
		return Auth(
			errorParser: errorParser,
			sessionManager: commonSession,
			queue: sessionQueue
		)
	}
	
	/// Возвращает запрос продуктов
	func makeProductDataRequestFactory() -> ProductRequestFactory {
		let errorParser = makeErrorParser()
		return ProductManager(
			errorParser: errorParser,
			sessionManager: commonSession,
			queue: sessionQueue
		)
	}
}
