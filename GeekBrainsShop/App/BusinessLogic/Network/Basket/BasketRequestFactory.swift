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
	
	/// Добавляет товар в корзину
	func addToBasket(
		productId: Int,
		quantity: Int,
		completionHandler: @escaping (AFDataResponse<AddToBasketResult>) -> Void
	)
	
	func removeFromBasket(
		productId: Int,
		completionHandler: @escaping (AFDataResponse<RemoveFromBasketResult>) -> Void
	)
}
