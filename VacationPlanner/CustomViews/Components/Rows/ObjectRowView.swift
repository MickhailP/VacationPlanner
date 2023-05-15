//
//  ObjectRowView.swift
//  VacationPlanner
//
//  Created by Миша Перевозчиков on 14.05.2023.
//

import SwiftUI

struct ObjectRowView: View {
	let object: Object

	var body: some View {
		HStack {
			AsyncImage(url: URL(string: object.image) ) { image in
				image
					.resizable()
					.scaledToFill()
			} placeholder: {
				ProgressView()
			}

			.frame(maxWidth: 120, maxHeight: 70)
			.background(.ultraThickMaterial)
			.clipShape(RoundedRectangle(cornerRadius: 12))



			VStack(alignment: .leading){
				Text(object.name)
					.font(.title3)


				Text(object.description)
					.font(.subheadline)
					.lineLimit(2)
					.truncationMode(.tail)
			}
			.padding(.leading, 10)
		}
		.padding(.vertical, 10)
    }
}

struct ObjectRowView_Previews: PreviewProvider {
    static var previews: some View {
		List{
			ObjectRowView(object: Object.example)
		}
		.listStyle(.plain)
    }
}
