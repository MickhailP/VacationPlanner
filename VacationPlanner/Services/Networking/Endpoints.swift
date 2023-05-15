//
//  Endpoints.swift
//  VacationPlanner
//
//  Created by Миша Перевозчиков on 14.05.2023.
//

import Foundation

enum Endpoint {
	case base
}


extension Endpoint {

	var scheme: String { "https" }

	var host: String { "rsttur.ru" }

	var path: String {
		switch self {
			case .base:
				return "/api/base-app/map"
		}
	}

	var queryItems: [String: String]? {
		nil
	}
}


extension Endpoint {
	var url: URL? {
		var components = URLComponents()
		components.scheme = scheme
		components.host = host
		components.path = path

		let queryItems = queryItems?.compactMap{ URLQueryItem(name: $0.key, value: $0.value) }

		components.queryItems = queryItems

		return components.url
	}
}

