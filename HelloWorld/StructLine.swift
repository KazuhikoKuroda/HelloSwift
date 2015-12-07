//
//  StructLine.swift
//  HelloWorld
//
//  Created by 黒田和彦 on 2015/12/07.
//  Copyright © 2015年 Kazuhiko Kuroda. All rights reserved.
//

import Foundation

struct Point {
	var v:Int
	var h:Int
	init(v:Int, h:Int) {
		self.v = v
		self.h = h
	}
}

struct Line {
	var p1:Point
	var p2:Point
	mutating func move(v:Int, h:Int) {
		p1.v += v
		p1.h += h
		p2.v += v
		p2.h += h
	}
}
