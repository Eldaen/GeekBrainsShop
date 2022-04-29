//
//  ProductsFetchTests.swift
//  GeekBrainsShopTests
//
//  Created by Денис Сизов on 28.04.2022.
//

import XCTest
@testable import GeekBrainsShop

class ProductsFetchTests: XCTestCase {
	
	var requestFactory: RequestFactory!
	var productManager: ProductRequestFactory!

	override func setUpWithError() throws {
		requestFactory = RequestFactory()
		productManager = requestFactory.makeProductDataRequestFactory()
	}

	override func tearDownWithError() throws {
		requestFactory = nil
		productManager = nil
	}

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

	/// Тест корректного запроса списка продуктов
	/// Проверяем, что какие-то продукты пришли. Точнее проверять пока смысла нет.
	func testProductsListCorrectFetch() {
		// Given
		var products: [Product]?
		let validatorExpectation = expectation(description: #function)
		
		// When
		productManager.loadProducts(
			pageNumber: 1,
			categoryId: 1
		) { response in
			switch response.result {
			case .success(let result):
				products = result.products
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
			
			XCTAssertEqual(products?.isEmpty, false)
		}
	}
}
