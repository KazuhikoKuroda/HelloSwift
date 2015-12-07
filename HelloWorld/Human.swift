//
//  Human.swift
//  HelloWorld
//
//  Created by 黒田和彦 on 2015/12/07.
//  Copyright © 2015年 Kazuhiko Kuroda. All rights reserved.
//

import Foundation

class Human {
	let name:String
	var log:Double = 0.0
	init(name:String){
		self.name = name
	}
	func walk(km:Double) {
		log += km
		print("\(km)km 歩きます")
	}
	func kmLog() {
		print("\(log)km 進みました")
	}
}


class Hero:Human {
	let heroName:String
	var isHyperMode:Bool
	init(heroName:String, name:String) {
		self.heroName = heroName
		self.isHyperMode = false
		super.init(name: name)
	}
	func fly(km:Double) {
		log += km
		print("\(km)km 飛びます")
	}
	override func walk(km: Double) {
		if isHyperMode {
			log += km * 10
			print("\(km)km * 10 歩きます")
		} else {
			super.walk(km)
		}
	}
}