//
//  Register.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 25.04.2022.
//

import Foundation
import Alamofire

/// Структура для отправки запроса на регистрацию пользователя
struct Register: RequestRouter {
	var baseUrl: URL
	var method: HTTPMethod = .get
	var path: String = "register"
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
