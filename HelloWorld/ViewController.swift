//
//  ViewController.swift
//  HelloWorld
//
//  Created by 黒田和彦 on 2015/11/04.
//  Copyright (c) 2015年 Kazuhiko Kuroda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//		playStart()
//		playString()
//		playArrayDictionary()
//		playOptional()
		playFunc()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



	func playStart() {
		// Do any additional setup after loading the view, typically from a nib.
		println("helloworld")
		//        let hoge:Int = 10, fuga = "えん"
		//        println(String(hoge) + fuga)
		
		let tpl1:(String, Int) = ("太郎", 33)
		println(tpl1)
		
		let tpl2:(name:String, age:Int) = ("太郎", 33)
		println(tpl2.0 + " : " + String(tpl2.1) + "さい")
		println(tpl2.name + " : " + String(tpl2.age) + "さい")
		
		for i in (1...5){
			println("\(i)回目")
		}
		
		let colors = ["blue", "red"] + ["black", "white"]
		for color in colors {
			println(color)
		}
		
		let tokuten = arc4random_uniform(100)
		var result:Int;
		if (tokuten < 40) {
			println("\(tokuten)点：不合格")
			result = 0
		} else if (tokuten < 70) {
			println("\(tokuten)点：惜しいね")
			result = 1
		} else {
			println("\(tokuten)点：合格")
			result = 2
		}
		
		switch result {
		case 0, 1:
			println("補修決定")
		case 2:
			println("お疲れ様でした")
		default:
			println("error")
		}

		
		func checkSize(size:(width:Int, height:Int, weight:Int)) -> String {
			var ret = ""
			switch size {
			case let (width, height, _) where (width >= 60) || (height >= 60):
				return "規格外：幅or高さが60以上"
			case let (_, _, weight) where (weight >= 80):
				return "規格外：重さが８０以上"
			default:
				return "規格内"
			}
		}

		let obj1 = (60, 50, 70)
		let obj2:(Int, Int, Int) = (40, 50, 90)
		let obj3:(width:Int, height:Int, weight:Int) = (40, 50, 60)
		println(checkSize(obj1))
		println(checkSize(obj2))
		println(checkSize(obj3))
		
		let metro = ["M": "丸ノ内線", "H": "日比谷線", "G": "銀座線", "T": "東西線"]
		for (key, value) in metro {
			println("\(key)は\(value)です")
		}
		for key in metro.keys {
			println("\(key)どぇす")
		}
		for value in metro.values {
			println("\(value)どぇす")
		}
		
		var ticket=5, power=30
		while (ticket > 0) && (power < 100) {
			ticket--
			power += 20
		}
		println("\(power)、残チケット\(ticket)")
		
		var a:UInt32, b:UInt32, c:UInt32, total:Int
		do {
			a = arc4random_uniform(13)+1
			b = arc4random_uniform(13)+1
			c = arc4random_uniform(13)+1
			total = Int(a + b + c)
		} while (total != 21)
		println("\(a),\(b),\(c)")
		
		xloop: for x in 0...5 {
			yloop: for y in 0...5 {
				if (x < y) {
					print("\n")
					continue xloop
				}
				print((x, y))
			}
		}
		print("\n")
		print("\n")
		
		xloop: for x in 0...5 {
			yloop: for y in 0...5 {
				if (x > 3) {
					break xloop
				}
				print((x, y))
			}
			print("\n")
		}
	}
	
	
	func playString() {
		let stars = String(count:10, repeatedValue:Character("⭐️"))
		println(stars + String(count(stars)))
		
		let str1 = "SWIFT", str2 = "swift"
		if (str1.lowercaseString == str2.lowercaseString) {
			println("\(str1)と\(str2)は大小文字問わなければ同じ")
		}
		
		let tanka:String = "1000", kosu:String = "5"
		let kingaku:Int = tanka.toInt()! * kosu.toInt()!
		println(kingaku)
		
		let r = 120, pai = "3.14"
		let ensyu:Float = Float(2 * r) * (pai as NSString).floatValue
		println("円周は\(ensyu)です")
		
		let weight = 135.2, package = 10.5
		println("内容量" + weight.description + "グラム\nパッケージ含めると" +
			(weight + package).description + "グラム")
		
		let str3 = "あいうえおかきくけこ"
		let range:Range? = str3.rangeOfString("えおか")
		if let theRange = range {
			println("「\(str3)」の\(range!)は「\(str3[theRange])」")
		} else {
			println("見つかりません")
		}
		
		let address = "神奈川県茅ヶ崎市東海岸"
		let findindex = find(address, "県")
		if findindex != nil {
			let address1 = address[address.startIndex...findindex!]
			println("address1:\(address1)")
			var start2 = findindex?.successor()
			var end2 = address.endIndex
			let address2 = address[start2!..<end2]
			println("address2:\(address2)")
		}
		
		if address.hasPrefix("神奈川") && address.hasSuffix("東海岸") {
			println("神奈川ではじまり東海岸でおわる")
		}
		
		let start = advance(address.startIndex, 4)
		let end = advance(start, 4)
		let pickupaddress = address[start..<end]
		println(pickupaddress)
		
		var pickupaddress2 = (address as NSString).substringFromIndex(4)
		pickupaddress2 = (pickupaddress2 as NSString).substringToIndex(4)
		println(pickupaddress2)
	}

	
	func playArrayDictionary() {
		var colorarray = ["red", "green", "blue", "yellow", "green"]
		var colorcopy = colorarray[2...4]
		var colorarraylazycopy = colorarray
		colorarraylazycopy[0] = "redxxx"
		colorarray.removeAtIndex(0)
		colorarray.removeLast()
		println(colorarray)
		println(colorcopy)
		println(colorarraylazycopy)
		
		// 配列の場合は面倒くさいのかませないといけない、煩わしい
		// enumerateはキーと配列要素のタプルを返すものらしい
		// [(0, "red"), (1, "green"),,,] <= こんな感じ。
		for (index, value) in enumerate(colorarray) {
			println("\(index) : \(value)")
		}
		
		var colormerge:[String] = colorarray + ["gold", "silver", "rainbow"]
		println(colormerge)
		println(colormerge.reverse())
		
		var sortedcolor = colormerge.sorted({
			$0.uppercaseString < $1.uppercaseString
		})
		println(sortedcolor)
		
		let tupledic:[String:(val1:Int, val2:Int)] = ["p1":(1, 2), "p2":(3, 4), "p3":(5, 6)]
		var tarodic = ["name": "たろう", "age": 20, "height": 175.2]
		var jirodic = tarodic
		if (!tupledic.isEmpty) {
			println(tupledic.count)
			var sump1 = 0, sump2 = 0
			for (_, val) in tupledic {
				sump1 += val.val1
				sump2 += val.val2
			}
			println("p1:\(sump1) p2:\(sump2)")
		}
		tarodic["weight"] = 68
		jirodic["name"] = "じろう"
		println(tarodic.description)
		println(jirodic.description)
		jirodic.removeAll(keepCapacity: false)
		println(jirodic)
	}
	
	
	func playOptional() {
		var msg:String?
		msg = "ハロー"
		var newmsg:String = msg! + "・ザ・ワールド"
		println(newmsg)
		
		var cnt:Int?
		let value = 250 * (cnt ?? 2)
		println(value)
		
		if let msgval = msg {
			println("msgの値は" + msgval)
		} else {
			println("msgはnil")
		}
		
		var sumopt = 0
		let dicopt:[String:Int?] = ["a":23, "b":nil, "c":15, "d":nil]
		for (_, valopt) in dicopt {
			if let val = valopt {
				sumopt += val
			}
		}
		println(sumopt)
		
		
		
		
		class Player1 {
			var magic:Magic1?
		}
		class Magic1 {
			var spell:String = "puipui"
		}
		var user:Player1 = Player1()
		var spell = user.magic?.spell as String!
		println(spell)
		user.magic = Magic1()
		spell = user.magic?.spell as String!
		println(spell)
		
		class Magic {
			struct Stone {
				var color: String
				var spell: String
			}
			
			var magicPower:Int
			var magicStone:Stone
			
			init(spell:String) {
				self.magicPower = count(spell)/2
				let index = Int(arc4random_uniform(3))
				let colorarr = ["red", "blue", "yellow"]
				let color = colorarr[index]
				self.magicStone = Stone(color:color, spell:spell)
			}
			
			func doMagic() -> Stone? {
				if self.magicPower == 0 {
					self.magicPower = 3
					return nil
				} else {
					self.magicPower--
					return self.magicStone
				}
				
			}
		}
		class Player {
			var magic:Magic?
			init(spell:String?) {
				if (spell != nil) && (spell != "") {
					self.magic = Magic(spell: spell!)
				}
			}
		}
		
		var user1:Player = Player(spell: "puipui")
		for _ in 1...5 {
			var mp = user1.magic?.magicPower as Int!
			var stone:Magic.Stone? = user1.magic?.doMagic()
			var spell = stone?.spell as String!
			var color = stone?.color as String!
			println("MP:\(mp), 色:\(color), 呪文:\(spell)")
		}
	}

	func playFunc() {
		func dice() -> Int {
			let number = 1 + Int(arc4random_uniform(6))
			return number
		}
		for i:Int in 1...5 {
			println("\(i)回目：\(dice())")
		}

		func sum(numbers:Double...) -> Double {
			var total:Double = 0
			for num in numbers {
				total += num
			}
			return total
		}
		let ans = sum(1,2,3,4,5,6,7,8,9,10)
		println(ans)

		func message(name:String = "お客") -> String {
			return "\(name)様、こんにちは"
		}
		println(message())
		println(message(name: "田中"))
		
		func price(var yen:Int) -> Int {
			let tax = 1.08
			yen = Int(floor(Double(yen) * tax))
			return yen
		}
		var p1:Int = 1250
		let ans1:Int = price(p1)
		println("\(p1):\(ans1)")
		
		func bmi(weight kg:Double, height cm:Double) -> Double {
			if cm == 0 {
				return -1;
			}
			var result = kg / pow(cm * 0.01, 2)
			result = round(result * 10) / 10.0
			return result
		}
		func bmi2(#weight:Double, #height:Double) -> Double {
			return bmi(weight: weight, height: height)
		}
		println("体重68.5kg, 身長176.2cmのBMIは、\(bmi(weight: 68.5, height: 176.2))")
		println("体重68.5kg, 身長176.2cmのBMIは、\(bmi2(weight: 68.5, height: 176.2))")

        func arrayByInt(#arr:Array<Int>, #num:Int) -> Array<Int> {
			var result:[Int] = []
			for value in arr {
				result.append(value * num)
			}
			return result
		}
		println(arrayByInt(arr: [1,2,3,4,5], num: 2))

		func calcResult(#kokugo:Int, #eigo:Int, #sugaku:Int) -> (total:Int, avg:Double) {
			var result:(total:Int, avg:Double)
			result.total = kokugo + eigo + sugaku
			result.avg = round(Double(result.total) / 3 * 10) / 10
			return result
		}
		var result = calcResult(kokugo: 58, eigo: 78, sugaku: 91)
		println("合計：\(result.total) 平均：\(result.avg)")

		// オーバーロードは内部funcだと無理みたい
		func calc(#a:Int, #b:Int) -> Int {
			return a + b
		}
		println(calc(a: 11, b: 12))
		println(heikin(numbers: 1,2,3,4,5,9))
		
		func makeArray<T>(items:T ...) -> [T] {
			var ret:[T] = []
			for item in items {
				ret.append(item)
			}
			return ret
		}
		println(makeArray(1,2,3,4,5))
		println(makeArray("a", "b", "c"))
	}
	
	func heikin(#numbers:[Int]) -> Double {
		var total:Double = 0;
		for value in numbers {
			total += Double(value);
		}
		let avg:Double = total / Double(count(numbers))
		return round(avg * 10) / 10
	}
	
	func heikin(#numbers:Int...) -> Double {
		return heikin(numbers: numbers)
	}
}

