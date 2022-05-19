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
	let method: HTTPMethod = .post
	let path: String = "approveReview"
	let commentId: Int
	var parameters: Parameters? {
		return [
			"id_comment": commentId
		]
	}
}
