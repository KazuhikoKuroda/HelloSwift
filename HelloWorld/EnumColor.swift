//
//  EnumColor.swift
//  HelloWorld
//
//  Created by 黒田和彦 on 2015/12/07.
//  Copyright © 2015年 Kazuhiko Kuroda. All rights reserved.
//

import Foundation

enum Pattern {
	case Monotone(PColor)
	case Border(color1:PColor, color2:PColor)
	case Dots(base:PColor, dot1:PColor, dot2:PColor)
}

enum PColor:String {
	case red = "赤"
	case blue = "青"
	case yellow = "黄"
	case white = "白"
}