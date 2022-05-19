//
//  ReviewManager.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 19.05.2022.
//

import Foundation
import Alamofire

/// Менеджер управления отзывами
final class ReviewManager: AbstractRequestFactory {
	
	// MARK: - constants
	
	let errorParser: AbstractErrorParser
	let sessionManager: Session
	let queue: DispatchQueue
	
	/// Базовый URL запроса
	let baseUrl = URL(
		string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/"
	)!
	
	// MARK: - Init
	init(
		errorParser: AbstractErrorParser,
		sessionManager: Session,
		queue: DispatchQueue = DispatchQueue.global(qos: .utility
		)
	) {
		self.errorParser = errorParser
		self.sessionManager = sessionManager
		self.queue = queue
	}
}

// MARK: - ProductRequestFactory
extension ReviewManager: ReviewRequestFactory {
	func approveReview(commentId: Int, completionHandler: @escaping (AFDataResponse<ApproveReviewResult>) -> Void) {
		let requestModel = ApproveReview(baseUrl: baseUrl, commentId: commentId)
		self.request(request: requestModel, completionHandler: completionHandler)
	}
	
	func removeReview(commentId: Int, completionHandler: @escaping (AFDataResponse<RemoveReviewResult>) -> Void) {
		let requestModel = RemoveReview(baseUrl: baseUrl, commentId: commentId)
		self.request(request: requestModel, completionHandler: completionHandler)
	}
	
	func sendReview(
		userId: Int,
		reviewText: String,
		completionHandler: @escaping (AFDataResponse<SendReviewResult>) -> Void
	) {
		let requestModel = AddReview(baseUrl: baseUrl, userId: userId, reviewText: reviewText)
		self.request(request: requestModel, completionHandler: completionHandler)
	}
}
