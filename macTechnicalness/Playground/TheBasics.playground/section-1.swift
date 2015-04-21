// Playground - noun: a place where people can play

import Cocoa
import Foundation       //rand関数
import XCPlayground     //utilities for use in playgrounds

var `var` = "hoge"


let x = 0.0, y = 1.0, z = 1.0


var ほげほげほげ: Int?

ほげほげほげ = nil

var str = "Hello, playground"
println("str: \(str)")

print(str)
println(str)


var data0 = [12, 53, 15, 68, 46, 7, 0, 12, 36, 12, 744, 100, 50, 44, 43, 85]

for x in data0 {
    x
}

XCPExecutionShouldContinueIndefinitely()

//空のInt型配列を作成
var data = [Int]()

for i in 0..<50 {
    //初期化もしてくれるarc4randomを使用して、0〜100までの乱数を生成
    var tmp: Int = Int(arc4random_uniform(100))
    data.append(tmp)
}
data

for x in data {
    x
}

