//
//  AuthRequestFactory.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 21.04.2022.
//

import Foundation
import Alamofire

/// Протокол управления авторизацией пользователя
protocol AuthRequestFactory {
	
	/// Авторизовать пользователя по переданным параметрам
	func login(userName: String, password: String, completionHandler: @escaping
			   (AFDataResponse<LoginResult>) -> Void)
	
	/// Зарегистрировать пользователя
	func register(username: String,
				  password: String,
				  email: String,
				  gender: User.Genders,
				  creditCard: String,
				  bio: String,
				  completionHandler: @escaping
				  (AFDataResponse<RegisterResult>) -> Void
	)
	
}
