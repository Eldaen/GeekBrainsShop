//
//  User.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 21.04.2022.
//

import Foundation

/// Модель пользователя
struct User: Codable {
	let id: Int
	let login: String
	let name: String
	let lastname: String
	
	enum CodingKeys: String, CodingKey {
		case id = "id_user"
		case login = "user_login"
		case name = "user_name"
		case lastname = "user_lastname"
	}
	
	enum Genders: String {
		case male = "m"
		case female = "f"
	}
}
