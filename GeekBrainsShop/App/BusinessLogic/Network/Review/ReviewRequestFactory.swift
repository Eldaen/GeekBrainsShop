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
}
