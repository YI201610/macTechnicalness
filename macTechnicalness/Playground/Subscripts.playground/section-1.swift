// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//subscript(index: Int) -> Int {
//    get {
//        // return an appropriate subscript value here
//    }
//    set(newValue) {
//        // perform a suitable setting action here
//    }
//}
//
//subscript(index: Int) -> Int {
//    // return an appropriate subscript value here
//}

struct someStructure {
    
    subscript(someValue: Int) -> Int {
        
        get {
            
            //何かの値を返す
            return 0
        }
        
        set(newValue){
            //何かnewValueを使用して処理を行う
        }
    }
}

struct sampleA {
    let prop1: Int
    var prop2: Int
    
    subscript(value: Int) -> Int {
        
        get {
            return prop1 + value
        }
        
        set(newValue){
           prop2 = newValue
        }
        
    }
}

var sA = sampleA(prop1: 10, prop2: 20)
sA[5]
sA[5] = 500
sA[5]
sA.prop2


struct TimesTable {
    
    /*!
    @abstract   乗数
    */
    let multiplier: Int
    var hgoe: Int

    /*
    @comment    サブスクリプトを定義している。サブスクリプトを定義できるのは、型につき、１つのみ。
    */
    subscript(index: Int) -> Int {
    
        /*
        @comment    getter
        */
        get {
            return multiplier * index
        }
    
        /*
        @comment    setter
        */
        set(newValue) {
            println("newValue: \(newValue), hgoe: \(self.hgoe)")
            hgoe *= (newValue+100)
        }
    }
    
//    /*
//    @comment    読み出し専用のサブスクリプトでは、getキーワードを省略できる。
//    */
//    subscript(hoge: Int) -> Int {
//        return hoge*12
//    }
}

/*
@comment    インスタンスを生成
*/
var threeTimesTable = TimesTable(multiplier: 3, hgoe: 5)

/*
@comment    サブスクリプトを介して値を取得
*/
println("six times three is \(threeTimesTable[6])")

threeTimesTable.hgoe

/*
@comment    サブスクリプトのsetterを使って値をつっこむ
*/
threeTimesTable[1] = 5

/*
@comment    サブスクリプトの影響で、hgoe値の値が変化している
*/
threeTimesTable.hgoe




/*
@comment    辞書型の変数を作成
*/
var 材料データ = ["トマト": 8, "きゅうり": 6, "ひき肉": 4]

/*
@comment    辞書型の変数に、subscript形式でデータを登録している例
*/
材料データ["ピーマン"] = 2
材料データ




/*
@comment    subscriptの仕組みを使えば、行列も解り易く表現できます。
*/
struct 行列 {
    let 行: Int, 列: Int
    var グリッド: [Double]  //行列の各成分を１列に並べて保持する
    
    init(行: Int, 列: Int) {
        self.行 = 行
        self.列 = 列
        グリッド = Array(count: 行 * 列, repeatedValue: 0.0)
    }
    
    func 成分の有効判定(行数: Int, 列数: Int) -> Bool {
        return 行数 >= 0 && 行数 < 行 && 列数 >= 0 && 列数 < 列
    }
    
    subscript(行: Int, 列: Int) -> Double {
        get {
            assert(成分の有効判定(行, 列数: 列), "範囲外")
            return グリッド[(行 * 列) + 列]
        }
        set {
            assert(成分の有効判定(行, 列数: 列), "範囲外")
            グリッド[(行 * 列) + 列] = newValue
        }
    }
}

var matrix = 行列(行: 2, 列: 2)
matrix.成分の有効判定(100, 列数: 100)
matrix.成分の有効判定(1, 列数: 1)

matrix[0, 1] = 1.5
matrix[1, 0] = 3.2
matrix[1, 1]
matrix[1, 1] = 128.256
matrix[1, 1]
matrix[0, 0] = 1.3
//matrix[20, 15] = 5
matrix





