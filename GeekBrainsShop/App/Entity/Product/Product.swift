//
//  Product.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 28.04.2022.
//

import Foundation

/// Модель продукта
struct Product: Codable {
	let id: Int
	let name: String
	let price: Int
	
	enum CodingKeys: String, CodingKey {
		case id = "id_product"
		case name = "product_name"
		case price
	}
}
