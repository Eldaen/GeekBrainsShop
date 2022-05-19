//
//  ReviewsTests.swift
//  GeekBrainsShopTests
//
//  Created by Денис Сизов on 19.05.2022.
//

import XCTest
@testable import GeekBrainsShop

class ReviewsTests: XCTestCase {
	
	var requestFactory: RequestFactory!
	var reviewsManager: ReviewRequestFactory!

	override func setUpWithError() throws {
		requestFactory = RequestFactory()
		reviewsManager = requestFactory.makeReviewRequestFactory()
	}

	override func tearDownWithError() throws {
		requestFactory = nil
		reviewsManager = nil
	}

	func testExample() throws {
		// This is an example of a functional test case.
		// Use XCTAssert and related functions to verify your tests produce the correct results.
		// Any test you write for XCTest can be annotated as throws and async.
		// Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
		// Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
	}

	/// Тест на отправку правильного запроса на добавление отзыва
	func testSendCorrectReview() {
		// Given
		var reviewSendResult: Int?
		var resultMessage: String?
		let validatorExpectation = expectation(description: #function)
		
		// When
		reviewsManager.sendReview(
			userId: 123,
			reviewText: "Geekbrains рулит") { response in
				switch response.result {
				case .success(let result):
					reviewSendResult = result.result
					resultMessage = result.userMessage
					validatorExpectation.fulfill()
				case .failure(let error):
					print(error)
				}
			}
		
		//Then
		waitForExpectations(timeout: 1.0) { error in
			if error != nil {
				XCTFail()
			}
			
			XCTAssertEqual(reviewSendResult, 1)
			XCTAssertEqual(resultMessage, "Ваш отзыв был передан на модерацию")
		}
	}
	
	/// Тест на отправку правильного запроса на удаление отзыва
	func testCorrectReviewRemoval() {
		// Given
		var reviewRemovalResult: Int?
		let validatorExpectation = expectation(description: #function)
		
		// When
		reviewsManager.removeReview(
			commentId: 123) { response in
				switch response.result {
				case .success(let result):
					reviewRemovalResult = result.result
					validatorExpectation.fulfill()
				case .failure(let error):
					print(error)
				}
			}
		
		//Then
		waitForExpectations(timeout: 1.0) { error in
			if error != nil {
				XCTFail()
			}
			
			XCTAssertEqual(reviewRemovalResult, 1)
		}
	}
	
	/// Тест на отправку правильного запроса на одобрение отзыва
	func testCorrectReviewApproval() {
		// Given
		var reviewApprovalResult: Int?
		let validatorExpectation = expectation(description: #function)
		
		// When
		reviewsManager.approveReview(
			commentId: 123) { response in
				switch response.result {
				case .success(let result):
					reviewApprovalResult = result.result
					validatorExpectation.fulfill()
				case .failure(let error):
					print(error)
				}
			}
		
		//Then
		waitForExpectations(timeout: 1.0) { error in
			if error != nil {
				XCTFail()
			}
			
			XCTAssertEqual(reviewApprovalResult, 1)
		}
	}
}
