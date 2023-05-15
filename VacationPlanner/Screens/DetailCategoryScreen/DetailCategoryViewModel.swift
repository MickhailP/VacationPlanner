//
//  DetailCategoryScreen.swift
//  VacationPlanner
//
//  Created by Миша Перевозчиков on 14.05.2023.
//

import Foundation
import UIKit

final class DetailCategoryViewModel: ObservableObject {

	@Published var objects: [Object]

	init(objects: [Object]) {
		self.objects = objects
	}

	func goTo(lat: Double, long: Double) {

		guard let routeURL = URL(string: "dgis://2gis.ru/routeSearch/rsType/car/to/\(long),\(lat)") else {
			print("bad url 1")
			return
		}

		let application = UIApplication.shared

		if application.canOpenURL(routeURL) {
			application.open(routeURL)
		} else {
			guard let iTunesURL = URL(string: "https://apps.apple.com/ru/app/id481627348") else {
				print("bad url 2")
				return
			}

			application.open(iTunesURL)
		}
	}
}

