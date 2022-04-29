//
//  Logout.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 25.04.2022.
//

import Foundation
import Alamofire

/// Структура для отправки запроса на логаут пользователя
struct Logout: RequestRouter {
	var baseUrl: URL
	var method: HTTPMethod = .get
	var path: String = "logout"
	let id = "123"
	
	var parameters: Parameters? {
		return [
			"id_user": id
		]
	}
}
