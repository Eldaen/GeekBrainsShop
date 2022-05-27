//
//  AddToBasket.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 27.05.2022.
//

import Foundation
import Alamofire

/// Структура для описания запроса на отправку отзыва на модерацию
struct AddToBasket: RequestRouter {
	let baseUrl: URL
	let method: HTTPMethod = .get
	let path: String = "addToBasket"
	let productId: Int
	let quantity: Int
	var parameters: Parameters? {
		return [
			"id_product": productId,
			"quantity": quantity
		]
	}
}
