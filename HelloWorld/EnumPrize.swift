//
//  EnumPrize.swift
//  HelloWorld
//
//  Created by 黒田和彦 on 2015/12/07.
//  Copyright © 2015年 Kazuhiko Kuroda. All rights reserved.
//

import Foundation

enum Prize:Int {
	case Gold = 1, Silver, Bronze, Four, Five
	
	func description() -> String {
		switch self {
		case .Gold:
			return "優勝"
		case .Silver:
			return "準優勝"
		case .Bronze:
			return "準々優勝"
		default:
			return "入賞：" + String(self.rawValue) + "位"
		}
	}
}