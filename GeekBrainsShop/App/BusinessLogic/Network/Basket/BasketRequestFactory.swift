//
//  BasketRequestFactory.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 27.05.2022.
//

import Foundation
import Alamofire

/// Протокол загрузки данных товаров
protocol BasketRequestFactory {
	
	/// Загружает каталог товаров
	func loadProducts(
		productId: Int,
		quantity: Int,
		completionHandler: @escaping (AFDataResponse<AddToBasketResult>
		) -> Void)
}
