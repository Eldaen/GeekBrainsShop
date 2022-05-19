//
//  ReviewRequestFactory.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 19.05.2022.
//

import Foundation
import Alamofire

/// Протокол управления отзывами
protocol ReviewRequestFactory {
	
	/// Отправить отзыв на модерацию
	func sendReview(userId: Int, reviewText: String, completionHandler: @escaping
					(AFDataResponse<SendReviewResult>) -> Void)
	
	/// Удалить отзыв
	func removeReview(commentId: Int, completionHandler: @escaping
					  (AFDataResponse<RemoveReviewResult>) -> Void)
	
	/// Одобрить отзыв
	func approveReview(commentId: Int, completionHandler: @escaping
					  (AFDataResponse<ApproveReviewResult>) -> Void)
}
