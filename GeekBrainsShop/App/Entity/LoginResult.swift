//
//  LoginResult.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 21.04.2022.
//

import Foundation

/// Положительный ответ сервера при авторизации
struct LoginResult: Codable {
	let result: Int
	let user: User
}
