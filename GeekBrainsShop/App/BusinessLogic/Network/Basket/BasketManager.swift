//
//  BasketManager.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 27.05.2022.
//

import Foundation
import Alamofire

/// Менеджер загрузки данных корзины
final class BasketManager: AbstractRequestFactory {
	
	// MARK: - constants
	
	let errorParser: AbstractErrorParser
	let sessionManager: Session
	let queue: DispatchQueue
	
	/// Базовый URL запроса
	let baseUrl = URL(
		string: "http://192.0.0.1/"
	)!
	
	// MARK: - Init
	init(
		errorParser: AbstractErrorParser,
		sessionManager: Session,
		queue: DispatchQueue = DispatchQueue.global(qos: .utility
		)
	) {
		self.errorParser = errorParser
		self.sessionManager = sessionManager
		self.queue = queue
	}
}

// MARK: - ProductRequestFactory
extension BasketManager: BasketRequestFactory {
	func removeFromBasket(
		productId: Int,
		completionHandler: @escaping (AFDataResponse<RemoveFromBasketResult>) -> Void
	) {
		let requestModel = RemoveFromBasket(baseUrl: baseUrl, productId: productId)
		self.request(request: requestModel, completionHandler: completionHandler)
	}
	
	func addToBasket(
		productId: Int,
		quantity: Int,
		completionHandler: @escaping (AFDataResponse<AddToBasketResult>) -> Void
	) {
		let requestModel = AddToBasket(baseUrl: baseUrl, productId: productId, quantity: quantity)
		self.request(request: requestModel, completionHandler: completionHandler)
	}
}
