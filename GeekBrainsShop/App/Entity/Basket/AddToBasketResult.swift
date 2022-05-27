//
//  AddToBasketResult.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 27.05.2022.
//

import Foundation

/// Ответ сервера на отправку запроса на добавление товара в корзину
struct AddToBasketResult: Codable {
	let result: Int
	let errorMessage: String?
}
