//
//  Auth.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 21.04.2022.
//

import Foundation
import Alamofire

/// Управляет авторизацией
final class Auth: AbstractRequestFactory {
	
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

// MARK: - AuthRequestFactory
extension Auth: AuthRequestFactory {
	func register(
		username: String,
		password: String,
		email: String,
		gender: User.Genders,
		creditCard: String,
		bio: String,
		completionHandler: @escaping (AFDataResponse<RegisterResult>
		) -> Void) {
		let requestModel = Register(baseUrl: baseUrl,
									login: username,
									password: password,
									email: email,
									gender: gender,
									creditCard: creditCard,
									bio: bio)
		
		self.request(request: requestModel, completionHandler: completionHandler)
	}
	
	func changeUserData(
		username: String,
		password: String,
		email: String,
		gender: User.Genders,
		creditCard: String,
		bio: String,
		completionHandler: @escaping (AFDataResponse<ChangeUserDataResult>
		) -> Void) {
		let requestModel = Register(baseUrl: baseUrl,
									login: username,
									password: password,
									email: email,
									gender: gender,
									creditCard: creditCard,
									bio: bio)
		
		self.request(request: requestModel, completionHandler: completionHandler)
	}
	
	func login(
		userName: String,
		password: String,
		completionHandler: @escaping (AFDataResponse<LoginResult>
		) -> Void) {
		let requestModel = Login(baseUrl: baseUrl,
								 login: userName,
								 password: password)
		
		self.request(request: requestModel, completionHandler: completionHandler)
	}
	
	func logout(completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void) {
		let requestModel = Logout(baseUrl: baseUrl)
		
		self.request(request: requestModel, completionHandler: completionHandler)
	}
}
