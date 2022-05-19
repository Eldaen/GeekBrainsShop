//
//  AddReview.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 19.05.2022.
//

import Foundation
import Alamofire

/// Структура для описания запроса на отправку отзыва на модерацию
struct AddReview: RequestRouter {
	let baseUrl: URL
	let method: HTTPMethod = .get
	let path: String = "addReview.json"
	let userId: Int
	let reviewText: String
	var parameters: Parameters? {
		return [
			"idUser": userId,
			"text": reviewText
		]
	}
}
