//
//  CategoriesViewModel.swift
//  VacationPlanner
//
//  Created by Миша Перевозчиков on 14.05.2023.
//

import Foundation


final class CategoriesViewModel: ObservableObject {

	private let networkingService: NetworkingProtocol

	@Published private(set) var resortObjectsWithCategory: [Category: [Object]] = [:]

	var sortedCategoriesByCount: [Category] {
		resortObjectsWithCategory.keys.sorted(by: { $0.count > $1.count })
	}


	// MARK: Alert tracker
	@Published var showErrorMessage: Bool = false
	@Published var errorMessage: String = ""


	init(networkingService: NetworkingProtocol) {
		self.networkingService = networkingService
		fetchBaseInfo()
	}


	private func fetchBaseInfo() {
		guard let url = Endpoint.base.url else {
			showErrorMessage = true
			errorMessage = "Некорректный URL!"
			return
		}

		Task(priority: .userInitiated) {
			let result = await networkingService.downloadDataResult(from: url)

			switch result {
				case .success(let data):
					await decomposeAPIResponseFrom(data)

				case .failure(let failure):
					print(failure)
					showErrorMessage = true
					errorMessage = failure.localizedDescription
			}
		}
	}

	private func decomposeAPIResponseFrom(_ data: Data) async {
		do {
			let decoder = JSONDecoder()
			decoder.keyDecodingStrategy = .convertFromSnakeCase

			let apiResponse = try decoder.decode(APIResponse.self, from: data)

			await MainActor.run() {
				 createResortDictionary(from: apiResponse)
			}
		} catch {
			print(error)
			await MainActor.run() {
				showErrorMessage = true
				errorMessage = error.localizedDescription
			}
		}
	}


	private func createResortDictionary(from apiResponse: APIResponse) {
		let categories = apiResponse.data.categories
		let allResortObjects = apiResponse.data.objects

		categories.forEach { category in
			resortObjectsWithCategory[category] = allResortObjects.filter { $0.type == category.type }
		}
	}
}
