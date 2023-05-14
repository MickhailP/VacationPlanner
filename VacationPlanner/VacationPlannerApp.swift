//
//  VacationPlannerApp.swift
//  VacationPlanner
//
//  Created by Миша Перевозчиков on 14.05.2023.
//

import SwiftUI

@main
struct VacationPlannerApp: App {
    var body: some Scene {
        WindowGroup {
			CategoriesView(viewModel: CategoriesViewModel(networkingService: NetworkingService()))
				.preferredColorScheme(.dark)
        }
    }
}
