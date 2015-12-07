//
//  MyGame.swift
//  HelloWorld
//
//  Created by 黒田和彦 on 2015/12/07.
//  Copyright © 2015年 Kazuhiko Kuroda. All rights reserved.
//

import Foundation

class MyGame:GameProtocol {
	private var total:Int = 0
	var gamePoint:Int {
		get {
			return total
		}
	}
	func hit() {
		total += 10
		print("hitしました")
	}
	func miss(){
		total /= 2
		print("ミスった")
	}
}