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
	/// Корректность данных проверить не можем, смотрим только успешный ответ
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
	
	/// Проверяет успешную регистрацию нового пользователя
	/// Тут бы проверить, что пользователь вообще в принципе зарегистрировался, но у нас этого нет пока
	func testCorrectRegister() throws {
		// Given
		var message = ""
		let validatorExpectation = expectation(description: #function)
		
		// When
		auth.register(
			username: "Somebody",
			password: "mypassword",
			email: "some@some.ru",
			gender: .male,
			creditCard: "9872389-2424-234224-234",
			bio: "This is good! I think I will switch to another language"
		) { response in
			switch response.result {
			case .success(let result):
				message = result.userMessage
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
			
			XCTAssertEqual(message, "Регистрация прошла успешно!")
		}
	}
}
