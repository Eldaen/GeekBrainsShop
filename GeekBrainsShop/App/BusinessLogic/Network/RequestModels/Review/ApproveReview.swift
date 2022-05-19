//
//  ApproveReview.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 19.05.2022.
//

import Foundation
import Alamofire

/// Структура для описания запроса на отправку отзыва на модерацию
struct ApproveReview: RequestRouter {
	let baseUrl: URL
	let method: HTTPMethod = .get
	let path: String = "approveReview.json"
	let commentId: Int
	var parameters: Parameters? {
		return [
			"id_comment": commentId
		]
	}
}
