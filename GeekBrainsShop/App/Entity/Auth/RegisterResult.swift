//
//  RegisterResult.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 25.04.2022.
//

import Foundation

/// Положительный ответ сервера при регистрации пользователя
struct RegisterResult: Codable {
	let result: Int
	let userMessage: String
	
	enum CodingKeys: String, CodingKey {
		case result
		case userMessage = "user_message"
	}
}
