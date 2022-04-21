//
//  RequestRouter.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 21.04.2022.
//

import Foundation
import Alamofire

/// Типы кодирования запроса
enum RequestRouterEncoding {
	case url, json
}

/// Протокол реализации запроса к серверу
protocol RequestRouter: URLRequestConvertible {
	
	/// Базовый URL
	var baseUrl: URL { get }
	
	/// HTTP метод
	var method: HTTPMethod { get }
	
	/// Путь до запрашиваемого метода
	var path: String { get }
	
	/// Параметры
	var parameters: Parameters? { get }
	
	/// Полный URL запроса
	var fullUrl: URL { get }
	
	/// Тип кодирования запроса
	var encoding: RequestRouterEncoding { get }
}

// MARK: - RequestRouter extension
extension RequestRouter {
	var fullUrl: URL {
		return baseUrl.appendingPathComponent(path)
	}
	var encoding: RequestRouterEncoding {
		return .url
	}
	
	func asURLRequest() throws -> URLRequest {
		var urlRequest = URLRequest(url: fullUrl)
		urlRequest.httpMethod = method.rawValue
		
		switch self.encoding {
		case .url:
			return try URLEncoding.default.encode(urlRequest, with: parameters)
		case .json:
			return try JSONEncoding.default.encode(urlRequest, with: parameters)
		}
	}
}
