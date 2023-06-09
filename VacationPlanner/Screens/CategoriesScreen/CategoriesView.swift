//
//  CategoriesView.swift
//  VacationPlanner
//
//  Created by Миша Перевозчиков on 14.05.2023.
//

import SwiftUI

struct CategoriesView: View {

	@StateObject private var viewModel: CategoriesViewModel

	init(viewModel: CategoriesViewModel) {
		_viewModel = StateObject(wrappedValue: viewModel)
	}

    var body: some View {
		NavigationView {
			List(viewModel.sortedCategoriesByCount) { category in
				NavigationLink {
					if let objects = viewModel.resortObjectsWithCategory[category] {
						DetailCategoryView(viewModel: DetailCategoryViewModel(objects: objects))
					}
				} label: {
					rowLabelFor(category)
				}
			}
			.navigationTitle("Категории")
		}
    }
}


extension CategoriesView {
	private func rowLabelFor(_ category: Category) -> some View {
		HStack {
			Text(category.name)
				.font(.headline)
			Spacer()

			ObjectCounterView(count: category.count, colorHex: CustomColors.colorsDictionary[category.color] ?? "#000000")
		}
	}
}


struct CategoriesScreen_Previews: PreviewProvider {
    static var previews: some View {
		CategoriesView(viewModel: CategoriesViewModel(networkingService: NetworkingService()))
    }
}
