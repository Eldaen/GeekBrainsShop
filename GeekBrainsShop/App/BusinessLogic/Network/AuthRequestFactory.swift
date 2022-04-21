//
//  AuthRequestFactory.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 21.04.2022.
//

import Foundation
import Alamofire

/// Протокол авторизации пользователей
protocol AuthRequestFactory {
	
	/// Авторизовать пользователя по переданным параметрам
	func login(userName: String, password: String, completionHandler: @escaping
	(AFDataResponse<LoginResult>) -> Void)
}
