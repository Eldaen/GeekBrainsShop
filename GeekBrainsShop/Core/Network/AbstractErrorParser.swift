//
//  AbstractErrorParser.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 21.04.2022.
//

import Foundation

/// Протокол обработки ошибок
protocol AbstractErrorParser {
	
	/// Обработка ошибок от Alamofire
	func parse(_ result: Error) -> Error
	
	/// Обработка ошибок через получение данных
	func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
