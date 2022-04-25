//
//  Auth.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 21.04.2022.
//

import Foundation
import Alamofire

/// Занимается обработкой запроса "Войти"
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
	init(errorParser: AbstractErrorParser,
		 sessionManager: Session,
		 queue: DispatchQueue = DispatchQueue.global(qos: .utility)
	) {
		self.errorParser = errorParser
		self.sessionManager = sessionManager
		self.queue = queue
	}
}

// MARK: - AuthRequestFactory
extension Auth: AuthRequestFactory {
	func register(username: String,
				  password: String,
				  email: String,
				  gender: User.Genders,
				  creditCard: String,
				  bio: String,
				  completionHandler: @escaping (AFDataResponse<RegisterResult>) -> Void) {
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
		completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void) {
			let requestModel = Login(baseUrl: baseUrl,
									 login: userName,
									 password: password)
			
			self.request(request: requestModel, completionHandler: completionHandler)
		}
}

// MARK: - Auth extension
extension Auth {
	
	/// Структура для описания запроса авторизации пользователя
	struct Login: RequestRouter {
		let baseUrl: URL
		let method: HTTPMethod = .get
		let path: String = "login.json"
		let login: String
		let password: String
		var parameters: Parameters? {
			return [
				"username": login,
				"password": password
			]
		}
	}
	
	/// Структура для отправки запроса на регистрацию пользователя
	struct Register: RequestRouter {
		var baseUrl: URL
		var method: HTTPMethod = .get
		var path: String = "registerUser.json"
		let id = "123"
		let login: String
		let password: String
		let email: String
		let gender: User.Genders
		let creditCard: String
		let bio: String
		
		var parameters: Parameters? {
			return [
				"id_user": id,
				"username": login,
				"password": password,
				"email": email,
				"gender": gender.rawValue,
				"credit_card": creditCard,
				"bio": bio
			]
		}
	}
}
