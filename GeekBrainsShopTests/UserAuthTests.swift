//
//  UserLoginTests.swift
//  GeekBrainsShopTests
//
//  Created by Денис Сизов on 28.04.2022.
//

import XCTest
@testable import GeekBrainsShop

class UserAuthTests: XCTestCase {
	
	var requestFactory: RequestFactory!
	var auth: AuthRequestFactory!

    override func setUpWithError() throws {
		requestFactory = RequestFactory()
		auth = requestFactory.makeAuthRequestFatory()
    }

    override func tearDownWithError() throws {
        requestFactory = nil
		auth = nil
    }
	
	/// Проверяет авторизацию с корректными данными
	func testCorrectLogin() throws {
		// Given
		var user: User?
		let validatorExpectation = expectation(description: #function)
		
		// When
		auth.login(userName: "Somebody", password: "mypassword") { response in
			switch response.result {
			case .success(let result):
				user = result.user
				validatorExpectation.fulfill()
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
		
		//Then
		waitForExpectations(timeout: 1.0) { error in
			if error != nil {
				XCTFail()
			}
			
			guard let user = user else {
				XCTFail()
				return
			}	
			
			XCTAssertEqual(user.id, 123)
			XCTAssertEqual(user.login, "geekbrains")
			XCTAssertEqual(user.name, "John")
			XCTAssertEqual(user.lastname, "Doe")
		}
	}
}
