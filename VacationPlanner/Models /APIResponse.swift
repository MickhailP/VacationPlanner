//
//  APIResponse.swift
//  VacationPlanner
//
//  Created by Миша Перевозчиков on 14.05.2023.
//

import Foundation


// MARK: - Response
struct APIResponse: Codable {
	let success: Bool
	let error: JSONNull?
	let time: String
	let data: DataClass
}


// MARK: - DataClass
struct DataClass: Codable {
	let geo: GeoCoordinates
	let categories: [Category]
	let objects: [Object]
}


// MARK: - Category
struct Category: Codable, Identifiable, Hashable {
	let id = UUID()
	let name, type, icon, color: String
	let count: Int

	enum CodingKeys: CodingKey {
		case name, type, icon, color, count
	}
}


// MARK: - GeoCoordinates
struct GeoCoordinates: Codable {
	let lat, lon: Double
}


// MARK: - Object
struct Object: Codable, Identifiable  {
	let id: Int
	let name: String
	let description: String
	let image: String
	let type, icon, color: String
	let lat, lon: Double
	let workingHours: [WorkingHour]?

	static let example = Object(id: 1, name: "Cave", description: "Here is some description. lsaoda r,amsld o osndoall maodmrunndia sand ja!", image: "https://rsttur.ru/file/60c8769ba602f.jpeg", type: "shop", icon: "rst-surprise", color: "success-10", lat: 42.6, lon: 131.1, workingHours: nil)
}


// MARK: - WorkingHour
struct WorkingHour: Codable{
	let days: [Int]
	let from, to: String
}


// MARK: - Encode/decode helpers
class JSONNull: Codable, Hashable {

	public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
		return true
	}

	public var hashValue: Int {
		return 0
	}

	public func hash(into hasher: inout Hasher) {
	}

	public init() {}

	public required init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		if !container.decodeNil() {
			throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
		}
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encodeNil()
	}
}
