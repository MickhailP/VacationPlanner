//
//  DetailCategoryView.swift
//  VacationPlanner
//
//  Created by Миша Перевозчиков on 14.05.2023.
//

import SwiftUI

struct DetailCategoryView: View {

	@StateObject private var viewModel: DetailCategoryViewModel


	init(viewModel: DetailCategoryViewModel) {
		_viewModel = StateObject(wrappedValue: viewModel)
	}



	var body: some View {
		List {
			ForEach(viewModel.objects) { object in
				createRowFor(object)
					.onTapGesture {
						viewModel.goTo(lat: object.lat, long: object.lon)
					}

			}
		}
		.navigationTitle("Объекты")
		.navigationBarTitleDisplayMode(.large)
		.listStyle(.plain)
    }
}


extension DetailCategoryView {

	@ViewBuilder func createRowFor(_ object: Object) -> some View {
		if #available(iOS 16.0, *) {
			ObjectRowView(object: object)
				.padding(.horizontal)
				.alignmentGuide(.listRowSeparatorLeading) { viewDimensions in
					return 0
				}
		} else {
			ObjectRowView(object: object)
				.padding(.horizontal)
		}
	}
}

struct DetailCategoryScreen_Previews: PreviewProvider {
    static var previews: some View {

		let objects = Array(repeating: Object.example, count: 5)

		DetailCategoryView(viewModel: DetailCategoryViewModel(objects: objects))
	}
}
