//
//  ProductRequestFactory.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 28.04.2022.
//

import Foundation
import Alamofire

/// Протокол загрузки данных товаров
protocol ProductRequestFactory {
	
	/// Загружает каталог товаров
	func loadProducts(
		pageNumber: Int,
		categoryId: Int,
		completionHandler: @escaping (AFDataResponse<LoadProductsResult>
		) -> Void)
}
