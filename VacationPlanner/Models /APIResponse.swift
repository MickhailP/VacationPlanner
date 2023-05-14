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
struct Category: Codable {
	let name, type, icon, color: String
	let count: Int
}


// MARK: - GeoCoordinates
struct GeoCoordinates: Codable {
	let lat, lon: Double
}


// MARK: - Object
struct Object: Codable {
	let id: Int
	let name, description: String
	let image: String
	let type, icon, color: String
	let lat, lon: Double
	let workingHours: [WorkingHour]
}


// MARK: - WorkingHour
struct WorkingHour: Codable {
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
