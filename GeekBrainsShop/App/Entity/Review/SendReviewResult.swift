//
//  SendReviewResult.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 19.05.2022.
//

import Foundation

/// Ответ сервера на отправку отзыва на модерацию
struct SendReviewResult: Codable {
	let result: Int
	let userMessage: String?
	let errorMessage: String?
}
