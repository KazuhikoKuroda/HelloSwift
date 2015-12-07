//
//  StructStock.swift
//  HelloWorld
//
//  Created by 黒田和彦 on 2015/12/07.
//  Copyright © 2015年 Kazuhiko Kuroda. All rights reserved.
//

import Foundation

struct Stock {
	var name:String
	var data:[String:Int] = [:]
	
	init(name:String) {
		self.name = name
	}
	
	subscript(color:String, size:Double) -> Int {
		get {
			let key = color + size.description
			if let value = data[key] {
				return value
			} else {
				return 0
			}
		}
		set {
			let key = color + size.description
			data[key] = newValue
		}
	}
}