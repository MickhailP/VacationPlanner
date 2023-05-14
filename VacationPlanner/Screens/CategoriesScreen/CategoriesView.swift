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
			List(viewModel.categories) { category in
				NavigationLink {
					//CategoryDetailView here
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

			Text("\(category.count)")

		}
	}
}

struct CategoriesScreen_Previews: PreviewProvider {
    static var previews: some View {
		CategoriesView(viewModel: CategoriesViewModel(networkingService: NetworkingService()))
    }
}
