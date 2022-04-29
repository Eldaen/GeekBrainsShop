//
//  ProductManager.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 28.04.2022.
//

import Foundation
import Alamofire

/// Занимается загрузкой данных о продуктах
final class ProductManager: AbstractRequestFactory {
	
	// MARK: - constants
	
	let errorParser: AbstractErrorParser
	let sessionManager: Session
	let queue: DispatchQueue
	
	/// Базовый URL запроса
	let baseUrl = URL(
		string: "https://sizov-denis-gb-shop.herokuapp.com/"
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
extension ProductManager: ProductRequestFactory {
	func loadProducts(
		pageNumber: Int,
		categoryId: Int,
		completionHandler: @escaping (AFDataResponse<LoadProductsResult>
		) -> Void) {
		let requestModel = CatalogData(baseUrl: baseUrl, pageNumber: pageNumber, categoryId: categoryId)
		self.request(request: requestModel, completionHandler: completionHandler)
	}
}
