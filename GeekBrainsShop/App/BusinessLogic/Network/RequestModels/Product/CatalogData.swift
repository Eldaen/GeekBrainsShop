//
//  CatalogData.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 28.04.2022.
//

import Foundation
import Alamofire

/// Структура для описания запроса каталога товаров
struct CatalogData: RequestRouter {
	let baseUrl: URL
	let method: HTTPMethod = .post
	let path: String = "loadProducts"
	let pageNumber: Int
	let categoryId: Int
	var parameters: Parameters? {
		return [
			"page_number": pageNumber,
			"id_category": categoryId
		]
	}
}
