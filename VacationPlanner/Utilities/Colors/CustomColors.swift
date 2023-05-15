//
//  Colors.swift
//  VacationPlanner
//
//  Created by Миша Перевозчиков on 15.05.2023.
//

import Foundation

struct CustomColors {

	static let colorsDictionary = decomposed()

	static private func decomposed() -> [String: String] {
		var dictionary = [String: String]()

		colorsString.components(separatedBy: "\n").forEach { item in
			let items = item.components(separatedBy: ": ")
			if let key = items.first, let value = items.last {
				dictionary[key] = value
			}
		}

		return dictionary
	}


	static let colorsString =  """
gray-01: #FFFFFF
gray-02: #FFFFFF
gray-03: #FFFFFF
gray-04: #FFFFFF
gray-05: #FAFAFA
gray-06: #F5F5F5
gray-07: #E5E5E5
gray-08: #D9D9D9
gray-09: #D1D1D1
gray-10: #BFBFBF
gray-11: #C7C7C7
gray-12: #A6A6A6
gray-13: #999999
gray-14: #808080
gray-15: #666666
gray-16: #4D4D4D
gray-17: #333333
gray-18: #212121
gray-19: #0D0D0D
gray-20: #0D0D0D
primary-01: #F2F8FF
primary-02: #E6F1FE
primary-03: #CCE3FE
primary-04: #B3D5FD
primary-05: #99C7FD
primary-06: #80B9FC
primary-07: #66ABFC
primary-08: #4096FB
primary-09: #2688FB
primary-10: #1A81FA
success-01: #F3FBF7
success-02: #E7F6F0
success-03: #CFEDE1
success-04: #B8E5D2
success-05: #A0DCC3
success-06: #88D3B3
success-07: #70CAA4
success-08: #41B986
success-09: #29B077
success-10: #11A768
warning-01: #FEF9F2
warning-02: #FDF3E6
warning-03: #FBE8CC
warning-04: #F9DCB3
warning-05: #F7D199
warning-06: #F5C580
warning-07: #F3BA66
warning-08: #EFA333
warning-09: #ED971A
warning-10: #EB8C00
danger-01: #FFF5F5
danger-02: #FFECEB
danger-03: #FFD8D6
danger-04: #FFC5C2
danger-05: #FFB1AD
danger-06: #FF9E99
danger-07: #FF8B85
danger-08: #FF645C
danger-09: #FF5047
danger-10: #FF3D33
info-01: #F2F9FC
info-02: #E6F3FA
info-03: #CCE8F5
info-04: #B3DCF0
info-05: #99D1EB
info-06: #80C5E5
info-07: #66B9E0
info-08: #33A2D6
info-09: #1A97D1
info-10: #008BCC
violet-01: #F6F4FA
violet-02: #ECE9F5
violet-03: #DAD4EB
violet-04: #C7BEE0
violet-05: #B5A9D6
violet-06: #A293CC
violet-07: #8F7DC2
violet-08: #6A52AD
violet-09: #583DA3
violet-10: #452799
purple-01: #F9F4FA
purple-02: #F3E9F5
purple-03: #E7D3EB
purple-04: #DCBEE0
purple-05: #D0A8D6
purple-06: #C492CC
purple-07: #B87CC2
purple-08: #A151AD
purple-09: #953BA3
purple-10: #892599
yellow-01: #FFFDF2
yellow-02: #FFFCE6
yellow-03: #FFF8CC
yellow-04: #FFF5B3
yellow-05: #FFF199
yellow-06: #FFEE80
yellow-07: #FFEB66
yellow-08: #FFE433
yellow-09: #FFE01A
yellow-10: #FFDD00
cyan-01: #F2F9FA
cyan-02: #E6F4F5
cyan-03: #CCE9EB
cyan-04: #B3DEE1
cyan-05: #99D3D7
cyan-06: #80C8CD
cyan-07: #66BDC3
cyan-08: #33A7AF
cyan-09: #1A9CA5
cyan-10: #00919B
"""
}
