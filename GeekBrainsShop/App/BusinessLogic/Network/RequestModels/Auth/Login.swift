//
//  Login.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 25.04.2022.
//

import Foundation
import Alamofire

/// Структура для описания запроса авторизации пользователя
struct Login: RequestRouter {
	let baseUrl: URL
	let method: HTTPMethod = .post
	let path: String = "login"
	let login: String
	let password: String
	var parameters: Parameters? {
		return [
			"username": login,
			"password": password
		]
	}
}
