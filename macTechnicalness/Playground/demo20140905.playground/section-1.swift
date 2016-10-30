// Playground - noun: a place where people can play

import UIKit
import Foundation       //rand関数
import XCPlayground     //

/*!
@abstract   アルゴリズム1: 累乗計算
*/
for i in 0 ..< 50 {
    i*i
}

/*!
@abstract   アルゴリズム2: 漸化式で組み合わせの数(nCr)を求める
*/
func combination(n: Int, r: Int) -> Int {
    var p: Int = 1
    
    for i in 1 ..< r {
        p = p*(n-i+1)/i
        p
    }
    
    return p
}

let r = 3
for n in 1...10 {
    var y = combination(n, r: r)
    y
}


/*!
@abstract   XCPCaptureValueを用いて値(data)の状態をキャプチャする
*/
func visualization<T>(data: [T], title: String){
    for x in data {
        x
        XCPCaptureValue(title, value: x)
    }
}

/*!
@abstract   アルゴリズム3: 乱数を配列に格納する
*/
var data = [Int]()
for i in 0..<10 {
    //初期化もしてくれるarc4randomを使用して、0〜100までの乱数を生成
    var tmp: Int = Int(arc4random_uniform(100))
    data.append(tmp)
    
    //データに乱数が格納されてゆく様を、可視化する
    visualization(data, title: "経過:\(i)")
}
data

for x in data {
    x
}

//-----------------------------
/*!
@abstract カラー
*/
let color1 = UIColor.greenColor()
let color2 = UIColor.redColor()

