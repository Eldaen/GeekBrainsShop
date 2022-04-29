//
//  LoadProductsResult.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 29.04.2022.
//

import Foundation

/// Ответ сервера на запрос списка товаров
struct LoadProductsResult: Codable {
	let result: Int?
	let pageNumber: Int
	let products: [Product]
	
	enum CodingKeys: String, CodingKey {
		case result
		case pageNumber = "page_number"
		case products
	}
}
