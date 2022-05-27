//
//  RemoveFromBasketResult.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 27.05.2022.
//

import Foundation

/// Ответ сервера на отправку запроса на удаление товара из корзины
struct RemoveFromBasketResult: Codable {
	let result: Int
	let errorMessage: String?
}
