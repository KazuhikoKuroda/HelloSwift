//
//  GameProtocol.swift
//  HelloWorld
//
//  Created by 黒田和彦 on 2015/12/07.
//  Copyright © 2015年 Kazuhiko Kuroda. All rights reserved.
//

import Foundation

protocol GameProtocol {
	var gamePoint:Int { get }
	func hit()
	func miss()
}