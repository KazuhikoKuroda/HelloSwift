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

