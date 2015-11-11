//
//  MyClass.swift
//  HelloWorld
//
//  Created by 黒田和彦 on 2015/11/09.
//  Copyright (c) 2015年 Kazuhiko Kuroda. All rights reserved.
//

import Foundation

class MyClass {
	let msg:String
	let name:String?
	private struct Property {
		static var version:String = "1.0.0"
		static var objectCount:Int = 0
	}
	
	class var version:String {
		get {
			return Property.version
		}
		set(str) {
			Property.version = str
		}
	}

	init(msg:String) {
		self.msg = msg
		self.name = nil
		Property.objectCount += 1
	}
	init(msg:String, name:String) {
		self.msg = msg
		self.name = name
		Property.objectCount += 1
	}
	convenience init() {
		self.init(msg: "はるぉ", name: "匿名")
	}

	
	deinit {
		println("\(msg)　のdeinitが呼ばれました")
	}
	func hello() {
		var message:String = "\(Property.objectCount)個目："
		if let user = name {
			message += "\(user)さん、\(msg)"
		} else {
			message += msg
		}
		println(message)
	}
}