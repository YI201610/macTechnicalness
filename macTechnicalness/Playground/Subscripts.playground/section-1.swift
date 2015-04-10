// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


/*
@comment    subscript使用例
*/
var hogeArray = ["あ", "い", "う"]
hogeArray[2] = "え"
hogeArray




/*
@comment    辞書型の変数を作成
*/
var 材料データ = ["トマト": 8, "きゅうり": 6, "ひき肉": 4]

/*
@comment    辞書型の変数に、subscript構文でデータを登録している例
*/
材料データ["ピーマン"] = 2
材料データ




struct hogeStructure {
    
    /*
    @comment  読み込み専用のsubscriptであればgetキーワードを省略できます。
    */
    subscript(param1: Int, param2: String) -> Int {
        return 12345
    }
}

var a = hogeStructure()
var b = a[500, "some param"]

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

/*
@comment    getter, setterをもつsubscriptの定義例。sampleAというクラスの型の取り扱いを拡張しています。
*/
struct sampleA {
    let prop1: Int
    var prop2: Int
    
    /*
    @comment    subscriptで型の取り扱い方を増やす
    */
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

    
    var hogeElement: Int

    /*
    @comment    第1のsusbscriptを定義
    */
    subscript(index: Int) -> Int {
    
        /*
        @comment    getter
        */
        get {
            return multiplier * index
        }
    
        /*
        @comment    システムが提供してくれる、デフォルトのsetter入力パラメータ名は、newValue
        */
        set {
            println("newValue: \(newValue), hogeElement: \(self.hogeElement)")
            hogeElement *= (newValue+100)
        }
    }
    
    
    /*
    @comment    第２のsubscriptを定義
    */
    subscript (index1: Int, Index2: Int) -> Int {
        get {
            return 100
        }
        
        set(hogeValue){
            
        }
    }
    
    /*
    @comment    読み出し専用のサブスクリプトでは、getキーワードを省略できる。
    */
    subscript(hoge: Int, hoge2: Int, hoge3: Int) -> Int {
        return hoge*12
    }
}

/*
@comment    インスタンスを生成
*/
var ３倍テーブル = TimesTable(multiplier: 3, hogeElement: 5)
３倍テーブル

/*
@comment    サブスクリプトを介して値を取得
*/
println("six times three is \(３倍テーブル[6])")     //
３倍テーブル.hogeElement

/*
@comment    サブスクリプトのsetterを使って値をつっこむ
*/
３倍テーブル[1] = 5   //第１subscriptのsetterが発動

/*
@comment    サブスクリプトの影響で、hogeElement値の値が変化している
*/
３倍テーブル.hogeElement



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

/*
@comment    2x2行列を作成
*/
var matrix = 行列(行: 2, 列: 2)

/*
@comment    行列の大きさを検証
*/
matrix.成分の有効判定(100, 列数: 100)
matrix.成分の有効判定(1, 列数: 1)

/*
@comment    subscript表現を使用して、matrixに値をつっこんでみる
*/
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2
matrix[1, 1]
matrix[1, 1] = 128.256
matrix[1, 1]
matrix[0, 0] = 1.3
//matrix[20, 15] = 5

/*
@comment    matrixにつっこまれた各値を確認
*/
matrix





