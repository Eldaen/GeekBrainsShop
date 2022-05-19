//
//  RemoveReview.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 19.05.2022.
//

import Foundation
import Alamofire

/// Структура для описания запроса на удаление отзыва
struct RemoveReview: RequestRouter {
	let baseUrl: URL
	let method: HTTPMethod = .post
	let path: String = "removeReview"
	let commentId: Int
	var parameters: Parameters? {
		return [
			"id_comment": commentId
		]
	}
}
