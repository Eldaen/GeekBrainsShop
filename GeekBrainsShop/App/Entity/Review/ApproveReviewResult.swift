//
//  ApproveReviewResult.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 19.05.2022.
//

import Foundation

/// Ответ сервера на отправку отзыва на модерацию
struct ApproveReviewResult: Codable {
	let result: Int
	let errorMessage: String?
}
