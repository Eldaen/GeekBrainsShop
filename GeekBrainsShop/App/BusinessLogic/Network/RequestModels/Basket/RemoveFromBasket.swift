//
//  RemoveFromBasket.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 27.05.2022.
//

import Foundation
import Alamofire

/// Структура для описания запроса на отправку отзыва на модерацию
struct RemoveFromBasket: RequestRouter {
	let baseUrl: URL
	let method: HTTPMethod = .get
	let path: String = "deleteFromBasket"
	let productId: Int
	var parameters: Parameters? {
		return [
			"id_product": productId
		]
	}
}
