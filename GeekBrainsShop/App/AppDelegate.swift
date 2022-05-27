//
//  AppDelegate.swift
//  GeekBrainsShop
//
//  Created by Денис Сизов on 20.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	/// Фабрика запросов в сеть
	let requestFactory = RequestFactory()
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		let auth = requestFactory.makeAuthRequestFatory()
		auth.login(userName: "Somebody", password: "mypassword") { response in
			switch response.result {
			case .success(let result):
				print(result)
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
		
		auth.register(
			username: "Somebody",
			password: "mypassword",
			email: "some@some.ru",
			gender: .male,
			creditCard: "9872389-2424-234224-234",
			bio: "This is good! I think I will switch to another language"
		) { response in
			switch response.result {
			case .success(let result):
				print(result)
			case .failure(let error):
				print(error)
			}
		}
		
		auth.logout { response in
			switch response.result {
			case .success(let result):
				print(result)
			case .failure(let error):
				print(error)
			}
		}
		
		auth.changeUserData(
			username: "Somebody",
			password: "mypassword",
			email: "some@some.ru",
			gender: .male,
			creditCard: "9872389-2424-234224-234",
			bio: "This is good! I think I will switch to another language"
		) { response in
			switch response.result {
			case .success(let result):
				print(result)
			case .failure(let error):
				print(error)
			}
		}
		
		let products = requestFactory.makeProductDataRequestFactory()
		products.loadProducts(pageNumber: 1, categoryId: 1) { response in
			switch response.result {
			case .success(let result):
				print(result)
			case .failure(let error):
				print(error)
			}
		}
		
		let reviews = requestFactory.makeReviewRequestFactory()
		reviews.sendReview(userId: 123, reviewText: "Geekbrains рулит") { response in
			switch response.result {
			case .success(let result):
				print(result)
			case .failure(let error):
				print(error)
			}
		}
		
		reviews.removeReview(commentId: 123) { response in
			switch response.result {
			case .success(let result):
				print(result)
			case .failure(let error):
				print(error)
			}
		}
		
		reviews.approveReview(commentId: 123) { response in
			switch response.result {
			case .success(let result):
				print(result)
			case .failure(let error):
				print(error)
			}
		}
		
		let basket = requestFactory.makeBasketRequestFactory()
		basket.addToBasket(productId: 123, quantity: 1) { response in
			switch response.result {
			case .success(let result):
				print(result)
			case .failure(let error):
				print(error)
			}
		}
		
		basket.removeFromBasket(productId: 123) { response in
			switch response.result {
			case .success(let result):
				print(result)
			case .failure(let error):
				print(error)
			}
		}
		
		return true
	}
	
	// MARK: UISceneSession Lifecycle
	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
		// Called when a new scene session is being created.
		// Use this method to select a configuration to create the new scene with.
		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}
	
	func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
		// Called when the user discards a scene session.
		// If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
		// Use this method to release any resources that were specific to the discarded scenes, as they will not return.
	}
}
