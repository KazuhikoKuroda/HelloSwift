//
//  Circle.swift
//  HelloWorld
//
//  Created by 黒田和彦 on 2015/12/04.
//  Copyright © 2015年 Kazuhiko Kuroda. All rights reserved.
//

import Foundation


class Circle {
	var radius:Double = 1.0
	var area:Double {
		get {
			return radius * radius * M_PI
		}
		set (menseki) {
			radius = sqrt(menseki / M_PI)
		}
	}
	
	init() {
		area = 4
	}
}