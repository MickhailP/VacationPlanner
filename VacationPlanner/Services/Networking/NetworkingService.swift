//
//  NetworkingService.swift
//  VacationPlanner
//
//  Created by Миша Перевозчиков on 14.05.2023.
//

import Foundation
import UIKit


actor NetworkingService: NetworkingProtocol {

	func downloadDataResult(from url: URL?) async -> Result<Data,Error> {

		guard let url = url else {
			return .failure( URLError(.badURL))
		}

		do {
			let (data, response) = try await URLSession.shared.data(from: url)
			try handleResponse(response)
			return .success(data)
		} catch {
			print(error)
			print("There was an error during data fetching! ", error.localizedDescription)
			return .failure(error)
		}
	}


	func fetchImage(from urlString: String) async -> UIImage? {
		guard let url = URL(string: urlString) else   {
			return nil
		}

		do {
			let (data, response) = try await URLSession.shared.data(from: url)
			try handleResponse(response)
			return UIImage(data: data)
		} catch  {
			print(error)
			return nil
		}
	}
}
