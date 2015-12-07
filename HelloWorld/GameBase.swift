//
//  GameBase.swift
//  HelloWorld
//
//  Created by 黒田和彦 on 2015/12/07.
//  Copyright © 2015年 Kazuhiko Kuroda. All rights reserved.
//

import Foundation

class GameBase {
	final func gameHit() {
		let times = arc4random() % 3
		if times == 0 {
			miss()
		} else {
			for _ in 0...times {
				hit()
			}
		}
	}
	
	func hit() {}
	func miss() {}
}