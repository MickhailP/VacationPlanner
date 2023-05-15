//
//  ObjectCounterView.swift
//  VacationPlanner
//
//  Created by Миша Перевозчиков on 15.05.2023.
//

import SwiftUI

struct ObjectCounterView: View {
	let count: Int
	let colorHex: String

    var body: some View {
		ZStack {
			Circle()
				.fill(Color(uiColor: UIColor(hex: colorHex) ?? .blue))
				.frame(maxHeight: 30)
			
			Text("\(count)")
				.foregroundColor(.white)
		}
    }
}

struct ObjectCounterView_Previews: PreviewProvider {
    static var previews: some View {
		ObjectCounterView(count: 1, colorHex: "#11A768")
    }
}
