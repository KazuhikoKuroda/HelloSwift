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
            for (key, val) in tupledic {
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
}

