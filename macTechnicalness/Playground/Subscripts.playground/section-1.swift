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


struct TimesTable {
    
    let multiplier: Int
    var hgoe: Int
    /*
    @comment    サブスクリプトを定義している
    */
    subscript(index: Int) -> Int {
        
        get {
            return multiplier * index
        }
    
        set(newValue) {
            hgoe *= 100
        }
    }
}

/*
@comment    インスタンスを生成
*/
var threeTimesTable = TimesTable(multiplier: 3, hgoe: 5)

/*
@comment    サブスクリプトを介して値を取得
*/
println("six times three is \(threeTimesTable[6])")

/*
@comment    サブスクリプトのsetterを使って値をつっこむ
*/
threeTimesTable[1] = 5

/*
@comment    サブスクリプトの影響で、hgoe値の値が変化している
*/
threeTimesTable.hgoe





var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2





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
    
//    func indexIsValidForRow2(row: Int, column: Int) -> Bool {
//        return row >= 0 && row < rows && column >= 0 && column < columns
//    }

}

var matrix = Matrix(rows: 2, columns: 2)



matrix[0, 1] = 1.5
matrix[1, 0] = 3.2



//いかの文と、indexIsValidForRow2の関係
//let someValue = matrix[2, 2]
// this triggers an assert, because [2, 2] is outside of the matrix bounds





