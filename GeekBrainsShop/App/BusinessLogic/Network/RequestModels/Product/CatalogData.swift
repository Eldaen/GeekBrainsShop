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
	let method: HTTPMethod = .get
	let path: String = "catalogData.json"
	let pageNumber: Int
	let categoryId: Int
	var parameters: Parameters? {
		return [
			"page_number": pageNumber,
			"id_category": categoryId
		]
	}
}
