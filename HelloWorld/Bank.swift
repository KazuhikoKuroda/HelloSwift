//
//  Bank.swift
//  HelloWorld
//
//  Created by 黒田和彦 on 2015/12/07.
//  Copyright © 2015年 Kazuhiko Kuroda. All rights reserved.
//

import Foundation

private class Bank {
	var zandaka:UInt = 0
	func inMoney(money:UInt) -> (Bool, UInt, UInt) {
		zandaka += money
		return (true, money, zandaka)
	}
	func outMoney(money:UInt) -> (Bool, UInt, UInt) {
		if zandaka >= money {
			zandaka -= money
			return (true, money, zandaka)
		} else {
			return (false, money, zandaka)
		}
	}
}

internal class BankManager {
	private var myBank:Bank
	private(set) var point:UInt = 0
	init() {
		myBank = Bank()
	}
	
	func nyukin(money:UInt) -> (Bool, UInt, UInt) {
		point += 10
		let result = myBank.inMoney(money)
		return result
	}
	func syukkin(money:UInt) -> (Bool, UInt, UInt) {
		let result = myBank.outMoney(money)
		return result
	}
}