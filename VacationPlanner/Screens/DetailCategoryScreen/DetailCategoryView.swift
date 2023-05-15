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
			ForEach(viewModel.sortedObjects) { object in
				createRowFor(object)
					.onTapGesture {
						viewModel.makeRouteTo(lat: object.lat, long: object.lon)
					}

			}
		}
		.navigationTitle("Объекты")
		.navigationBarTitleDisplayMode(.large)
		.listStyle(.plain)
		.toolbar {
			ToolbarItem(placement: .navigationBarTrailing) {
				sorterMenu
			}
		}
    }
}


extension DetailCategoryView {

//MARK: - ObjectRowView
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


//MARK: - Sorter Menu
	private var sorterMenu: some View {
		Menu{
			Button("By name") {
				viewModel.sorter = .byName
			}
			Button("Default") {
				viewModel.sorter = .none
			}
		} label: {
			HStack {
				Image(systemName: "arrow.up.arrow.down")
				Text("Sort")
			}
		}
	}
}

struct DetailCategoryScreen_Previews: PreviewProvider {
    static var previews: some View {

		let objects = Array(repeating: Object.example, count: 5)

		NavigationView {
			DetailCategoryView(viewModel: DetailCategoryViewModel(objects: objects))
		}
	}
}
