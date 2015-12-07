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
//		playFunc()
//		playClass()
//		playEnum()
		playStruct()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



	func playStart() {
		// Do any additional setup after loading the view, typically from a nib.
		print("helloworld")
		//        let hoge:Int = 10, fuga = "えん"
		//        println(String(hoge) + fuga)
		
		let tpl1:(String, Int) = ("太郎", 33)
		print(tpl1)
		
		let tpl2:(name:String, age:Int) = ("太郎", 33)
		print(tpl2.0 + " : " + String(tpl2.1) + "さい")
		print(tpl2.name + " : " + String(tpl2.age) + "さい")
		
		for i in (1...5){
			print("\(i)回目")
		}
		
		let colors = ["blue", "red"] + ["black", "white"]
		for color in colors {
			print(color)
		}
		
		let tokuten = arc4random_uniform(100)
		var result:Int;
		if (tokuten < 40) {
			print("\(tokuten)点：不合格")
			result = 0
		} else if (tokuten < 70) {
			print("\(tokuten)点：惜しいね")
			result = 1
		} else {
			print("\(tokuten)点：合格")
			result = 2
		}
		
		switch result {
		case 0, 1:
			print("補修決定")
		case 2:
			print("お疲れ様でした")
		default:
			print("error")
		}

		
		func checkSize(size:(width:Int, height:Int, weight:Int)) -> String {
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
		print(checkSize(obj1))
		print(checkSize(obj2))
		print(checkSize(obj3))
		
		let metro = ["M": "丸ノ内線", "H": "日比谷線", "G": "銀座線", "T": "東西線"]
		for (key, value) in metro {
			print("\(key)は\(value)です")
		}
		for key in metro.keys {
			print("\(key)どぇす")
		}
		for value in metro.values {
			print("\(value)どぇす")
		}
		
		var ticket=5, power=30
		while (ticket > 0) && (power < 100) {
			ticket--
			power += 20
		}
		print("\(power)、残チケット\(ticket)")
		
		var a:UInt32, b:UInt32, c:UInt32, total:Int
		repeat {
			a = arc4random_uniform(13)+1
			b = arc4random_uniform(13)+1
			c = arc4random_uniform(13)+1
			total = Int(a + b + c)
		} while (total != 21)
		print("\(a),\(b),\(c)")
		
		xloop: for x in 0...5 {
			yloop: for y in 0...5 {
				if (x < y) {
					print("\n", terminator: "")
					continue xloop
				}
				print((x, y), terminator: "")
			}
		}
		print("\n", terminator: "")
		print("\n", terminator: "")
		
		xloop: for x in 0...5 {
			yloop: for y in 0...5 {
				if (x > 3) {
					break xloop
				}
				print((x, y), terminator: "")
			}
			print("\n", terminator: "")
		}
	}
	
	
	func playString() {
		let stars = String(count:10, repeatedValue:Character("⭐️"))
		print(stars + String(stars.characters.count))
		
		let str1 = "SWIFT", str2 = "swift"
		if (str1.lowercaseString == str2.lowercaseString) {
			print("\(str1)と\(str2)は大小文字問わなければ同じ")
		}
		
		let tanka:String = "1000", kosu:String = "5"
		let kingaku:Int = Int(tanka)! * Int(kosu)!
		print(kingaku)
		
		let r = 120, pai = "3.14"
		let ensyu:Float = Float(2 * r) * (pai as NSString).floatValue
		print("円周は\(ensyu)です")
		
		let weight = 135.2, package = 10.5
		print("内容量" + weight.description + "グラム\nパッケージ含めると" +
			(weight + package).description + "グラム")
		
		let str3 = "あいうえおかきくけこ"
		let range:Range? = str3.rangeOfString("えおか")
		if let theRange = range {
			print("「\(str3)」の\(range!)は「\(str3[theRange])」")
		} else {
			print("見つかりません")
		}
		
		let address = "神奈川県茅ヶ崎市東海岸"
		let findindex = address.characters.indexOf("県")
		if findindex != nil {
			let address1 = address[address.startIndex...findindex!]
			print("address1:\(address1)")
			let start2 = findindex?.successor()
			let end2 = address.endIndex
			let address2 = address[start2!..<end2]
			print("address2:\(address2)")
		}
		
		if address.hasPrefix("神奈川") && address.hasSuffix("東海岸") {
			print("神奈川ではじまり東海岸でおわる")
		}
		
		let start = address.startIndex.advancedBy(4)
		let end = start.advancedBy(4)
		let pickupaddress = address[start..<end]
		print(pickupaddress)
		
		var pickupaddress2 = (address as NSString).substringFromIndex(4)
		pickupaddress2 = (pickupaddress2 as NSString).substringToIndex(4)
		print(pickupaddress2)
	}

	
	func playArrayDictionary() {
		var colorarray = ["red", "green", "blue", "yellow", "green"]
		let colorcopy = colorarray[2...4]
		var colorarraylazycopy = colorarray
		colorarraylazycopy[0] = "redxxx"
		colorarray.removeAtIndex(0)
		colorarray.removeLast()
		print(colorarray)
		print(colorcopy)
		print(colorarraylazycopy)
		
		// 配列の場合は面倒くさいのかませないといけない、煩わしい
		// enumerateはキーと配列要素のタプルを返すものらしい
		// [(0, "red"), (1, "green"),,,] <= こんな感じ。
		for (index, value) in colorarray.enumerate() {
			print("\(index) : \(value)")
		}
		
		let colormerge:[String] = colorarray + ["gold", "silver", "rainbow"]
		print(colormerge)
		print(Array(colormerge.reverse()))
		
		let sortedcolor = colormerge.sort({
			$0.uppercaseString < $1.uppercaseString
		})
		print(sortedcolor)
		
		let tupledic:[String:(val1:Int, val2:Int)] = ["p1":(1, 2), "p2":(3, 4), "p3":(5, 6)]
		var tarodic = ["name": "たろう", "age": 20, "height": 175.2]
		var jirodic = tarodic
		if (!tupledic.isEmpty) {
			print(tupledic.count)
			var sump1 = 0, sump2 = 0
			for (_, val) in tupledic {
				sump1 += val.val1
				sump2 += val.val2
			}
			print("p1:\(sump1) p2:\(sump2)")
		}
		tarodic["weight"] = 68
		jirodic["name"] = "じろう"
		print(tarodic.description)
		print(jirodic.description)
		jirodic.removeAll(keepCapacity: false)
		print(jirodic)
	}
	
	
	func playOptional() {
		var msg:String?
		msg = "ハロー"
		let newmsg:String = msg! + "・ザ・ワールド"
		print(newmsg)
		
		let cnt:Int? = 2
		let value = 250 * cnt!
		print(value)
		
		if let msgval = msg {
			print("msgの値は" + msgval)
		} else {
			print("msgはnil")
		}
		
		var sumopt = 0
		let dicopt:[String:Int?] = ["a":23, "b":nil, "c":15, "d":nil]
		for (_, valopt) in dicopt {
			if let val = valopt {
				sumopt += val
			}
		}
		print(sumopt)
		
		
		
		
		class Player1 {
			var magic:Magic1?
		}
		class Magic1 {
			var spell:String = "puipui"
		}
		let user:Player1 = Player1()
		var spell:String?
		if let spell1:String = user.magic?.spell as String! {
			print(spell1)
		}
		user.magic = Magic1()
		spell = user.magic?.spell as String!
		print(spell)
		
		class Magic {
			struct Stone {
				var color: String
				var spell: String
			}
			
			var magicPower:Int
			var magicStone:Stone
			
			init(spell:String) {
				self.magicPower = spell.characters.count/2
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
		
		let user1:Player = Player(spell: "puipui")
		for _ in 1...5 {
			let mp = user1.magic?.magicPower as Int!
			let stone:Magic.Stone? = user1.magic?.doMagic()
			let spell = stone?.spell as String!
			let color = stone?.color as String!
			print("MP:\(mp), 色:\(color), 呪文:\(spell)")
		}
	}

	func playFunc() {
		func dice() -> Int {
			let number = 1 + Int(arc4random_uniform(6))
			return number
		}
		for i:Int in 1...5 {
			print("\(i)回目：\(dice())")
		}

		func sum(numbers:Double...) -> Double {
			var total:Double = 0
			for num in numbers {
				total += num
			}
			return total
		}
		let ans = sum(1,2,3,4,5,6,7,8,9,10)
		print(ans)

		func message(name:String = "お客") -> String {
			return "\(name)様、こんにちは"
		}
		print(message())
		print(message("田中"))
		
		func price(var yen:Int) -> Int {
			let tax = 1.08
			yen = Int(floor(Double(yen) * tax))
			return yen
		}
		var p1:Int = 1250
		let ans1:Int = price(p1)
		print("\(p1):\(ans1)")
		
		func bmi(weight kg:Double, height cm:Double) -> Double {
			if cm == 0 {
				return -1;
			}
			var result = kg / pow(cm * 0.01, 2)
			result = round(result * 10) / 10.0
			return result
		}
		func bmi2(weight weight:Double, height:Double) -> Double {
			return bmi(weight: weight, height: height)
		}
		print("体重68.5kg, 身長176.2cmのBMIは、\(bmi(weight: 68.5, height: 176.2))")
		print("体重68.5kg, 身長176.2cmのBMIは、\(bmi2(weight: 68.5, height: 176.2))")

        func arrayByInt(arr arr:Array<Int>, num:Int) -> Array<Int> {
			var result:[Int] = []
			for value in arr {
				result.append(value * num)
			}
			return result
		}
		print(arrayByInt(arr: [1,2,3,4,5], num: 2))

		func calcResult(kokugo kokugo:Int, eigo:Int, sugaku:Int) -> (total:Int, avg:Double) {
			var result:(total:Int, avg:Double)
			result.total = kokugo + eigo + sugaku
			result.avg = round(Double(result.total) / 3 * 10) / 10
			return result
		}
		var result = calcResult(kokugo: 58, eigo: 78, sugaku: 91)
		print("合計：\(result.total) 平均：\(result.avg)")

		// オーバーロードは内部funcだと無理みたい
		func calc(a a:Int, b:Int) -> Int {
			return a + b
		}
		print(calc(a: 11, b: 12))
		print(heikin(numbers: 1,2,3,4,5,9))
		
		func makeArray<T>(items:T ...) -> [T] {
			var ret:[T] = []
			for item in items {
				ret.append(item)
			}
			return ret
		}
		print(makeArray(1,2,3,4,5))
		print(makeArray("a", "b", "c"))

		func hello(name name:String) -> String {
			return "\(name)さん、ハロー"
		}
		func bye(name name:String) -> String {
			return "\(name)さん、バイ"
		}
		var func1 = hello
		var func2 = bye
		func command(someFunc someFunc:(String) -> String, name:String) -> String {
			return someFunc(name)
		}
		print(command(someFunc: func1, name: "たなか"))
		print(command(someFunc: func2, name: "さとう"))
		
		func getPriceFunc(age age:Int) -> (Int) -> Int {
			func kidsPrice(kosu kosu:Int) -> Int {
				return kosu * 400
			}
			func adultPrice(kosu kosu:Int) -> Int {
				return kosu * 600
			}
			
			if (age > 12) {
				return adultPrice
			}
			return kidsPrice
		}
		let price10:(Int) -> Int = getPriceFunc(age: 10)
		let price20:(Int) -> Int = getPriceFunc(age: 20)
		print(price10(2))
		print(price20(2))
		
		let myFunc:(Int, Int) -> Int = {(a:Int, b:Int) -> Int in
			return a + b
		}
		print(myFunc(1,2))
		
		let resultC:Int = {(a:Int, b:Int) -> Int in
			return a * b
		}(2,3)
		print(resultC)

		let mapNums = [1,2,3,4,5]
		let resultMap = mapNums.map({ (let v:Int) -> Int in
			return v * 2
		})
//		let resultMap = map(mapNums){ (v:Int) -> Int in
//			return v * 2
//		}
//		let resultMap = map(mapNums){ v in v * 2 }
//		let resultMap = map(mapNums){ $0 * 2 }
		print(resultMap)

		let strArray:[String] = ["c", "a", "x"]
		let sortedArray:[String] = strArray.sort({(a:String, b:String) -> Bool in
			return a.uppercaseString < b.uppercaseString
		})
		print(sortedArray)

		func dicMap(var targetDictionary targetDictionary:[String:Int], closure:(String, Int) -> Int)
			-> [String:Int] {
			for (key, val) in targetDictionary {
				let newVal:Int = closure(key, val)
				targetDictionary[key] = newVal
			}
			return targetDictionary
		}
		let dic:[String:Int] = ["aaa":1, "bbb":2, "ccc":3]
		var retDic:[String:Int] = dicMap(targetDictionary: dic, closure: { (a:String , b:Int) -> Int in
			return b * 2
		})
		print(retDic)

		let dic2:Dictionary<String, Int> = ["aaa":1, "bbb":2, "ccc":3, "ddd": 4]
		let closure3 = {(a:String, b:Int) -> Int in
			return b * 3
		}
		retDic = dicMap(targetDictionary: dic2, closure: closure3)
		print(retDic)
	}
	func heikin(numbers numbers:[Int]) -> Double {
		var total:Double = 0;
		for value in numbers {
			total += Double(value);
		}
		let avg:Double = total / Double(numbers.count)
		return round(avg * 10) / 10
	}
	func heikin(numbers numbers:Int...) -> Double {
		return heikin(numbers: numbers)
	}

	
	func playClass() {
		let myObj = MyClass()
		myObj.hello()

		let myObj2 = MyClass(msg: "ほげハロー")
		myObj2.hello()
		
		let myObj3 = MyClass(msg: "こんにちは", name: "桜子")
		myObj3.hello()
		
		print(MyClass.version)
		MyClass.version = "1.1.0"
		print(MyClass.version)
		print(MyClass.hogehoge)
		
		print(MyClass.fugafuga)
		MyClass.fugafuga = "ふがふが"
		print(MyClass.fugafuga)
		
		print(Message.GoodMorning())
		print(Message.GoodBye())
		
		let myCircle = Circle()
		print(myCircle.radius)
		print(myCircle.area)
		
		myCircle.area = 2
		print(myCircle.radius)
		print(myCircle.area)
		
		let myBankManager = BankManager()
		print(myBankManager.nyukin(10000))
		print(myBankManager.syukkin(7000))
		print(myBankManager.syukkin(5000))

		let hero:Hero = Hero(heroName: "すぱーまん", name: "山田太郎")
		hero.walk(10)
		hero.isHyperMode = true
		hero.walk(10)
		hero.fly(120.5)
		hero.kmLog()
		
		let myGame:GameProtocol = MyGame()
		myGame.hit()
		print(myGame.gamePoint)
		myGame.miss()
		print(myGame.gamePoint)
		myGame.hit()
		print(myGame.gamePoint)
		
		let exGame:ExtendGame = ExtendGame()
		for _ in 0...5 {
			exGame.gameHit()
			print(exGame.gamePoint)
		}
		
		myObj.thankYou()
		myObj2.thankYou()
		myObj3.thankYou()
	}
	
	func playEnum() {
		func packing(size:WomensSize) -> String {
			var stuff:String
			switch size {
			case .XS, .S:
				stuff = "女性用XS, S サイズ備品"
			case .M:
				stuff = "女性用M サイズ備品"
			case .L:
				stuff = "女性用L サイズ備品"
			}
			return stuff
		}
		print(packing(WomensSize.S))
		
		print(MensSize.S.rawValue)
		print(MensSize.M.rawValue)
		print(MensSize.L.rawValue)
		print(MensSize.XL.rawValue)
		print(MensSize(rawValue: 155))
		
		let myPrize = Prize.Bronze
		print(myPrize.description())
		print(Prize.Five.description())
		if let yourPrize = Prize(rawValue: 6) {
			print(yourPrize.description())
		}
		
		let p1 = Pattern.Monotone(.red)
		let p2 = Pattern.Border(color1: .blue, color2: .white)
		let p3 = Pattern.Dots(base: .white, dot1: .yellow, dot2: .red)
		let patternlist:[Pattern] = [p1, p2, p3]
		for p in patternlist {
			switch p {
			case .Monotone(let c):
				print("\(c.rawValue)色の無地")
			case .Border(let c1, let c2):
				print("\(c1.rawValue)と\(c2.rawValue)のボーダー")
			case .Dots(let base, let d1, let d2):
				print("\(base.rawValue)色の記事に\(d1.rawValue)と\(d2.rawValue)の斑点")
			}
		}
	}
	
	func playStruct() {
		let point1 = Point(v: 10, h: 20)
		let point2 = Point(v: 20, h: 50)
		var line = Line(p1: point1, p2: point2)
		line.move(10, h: 100)
		print("移動後のp1座標: p1.v \(line.p1.v) p1.h \(line.p1.h)")
		print("移動後のp2座標: p2.v \(line.p2.v) p2.h \(line.p2.h)")
		
		var addixStock = Stock(name: "addix")
		addixStock["green", 24.5] = 3
		addixStock["green", 25.0] = 5
		addixStock["green", 25.0] += 1
		addixStock["red", 26.0] = 2
		
		print(addixStock["green", 24.5])
		print(addixStock["green", 25.0])
		print(addixStock["green", 26.0])
		print(addixStock["red", 26.0])
	}
}

