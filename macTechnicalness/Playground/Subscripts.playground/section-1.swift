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





struct Matrix {
    
    let rows: Int, columns: Int
    var grid: [Double]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0.0)
    }
    
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)



matrix[0, 1] = 1.5
matrix[1, 0] = 3.2



//いかの文と、indexIsValidForRow2の関係
//let someValue = matrix[2, 2]
// this triggers an assert, because [2, 2] is outside of the matrix bounds





