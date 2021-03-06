// Playground - noun: a place where people can play

import Foundation

var Aチーム得点 = [38, 73, 86, 90, 111, 124]
var Bチーム得点 = [71, 84, 85, 89, 90, 103]
var Cチーム得点 = [11, 22, 33, 44, 55, 66, 77, 1000]

Aチーム得点.sort{$0 < $1}
Bチーム得点.sort{$0 < $1}
Cチーム得点.sort{$0 < $1}
Aチーム得点
Bチーム得点
Cチーム得点

/*!
@abstract   平均を求める
*/
func 平均(ソース:Array<Int>) -> Float {
    
    var チームの平均:Float = 0;
    var チーム点数合計:Float = 0
    for 点数 in ソース {
        チーム点数合計 += Float(点数)
    }
    チームの平均 = Float(チーム点数合計) / Float(ソース.count)

    return チームの平均
}
let Aチームの平均 = 平均(Aチーム得点)
平均(Bチーム得点)
平均(Cチーム得点)

/*!
@abstract   中央値
*/
func 中央値(ソース:Array<Int>) -> Float {
    let countOfSource = Float(ソース.count)
    
    var idx:Int = 0
    var 候補IDX:Float = 0
    if(countOfSource % 2 == 0) {
        /*
        @comment    偶数の場合
        */
        let 候補IDX = Int(countOfSource/2)-1
        let 候補IDX2 = 候補IDX+1
        
        let value1:Float = Float(ソース[候補IDX])
        let value2:Float = Float(ソース[候補IDX2])
        
        let hoge:Float = (value1 + value2)/2

        return hoge //Float(ソース[idx] + ソース[候補IDX2])
    }else{
        /*
        @comment    奇数の場合
        */
        候補IDX = ceil(Float(countOfSource/2))-1
        idx = Int(候補IDX)
        return Float(ソース[idx])
    }
}
中央値(Aチーム得点)
中央値(Bチーム得点)
中央値(Cチーム得点)


/*!
@abstract  母集団の標準偏差
*/
func 母集団の標準偏差(ソース:Array<Int>) -> Double {
    var sum1:Int32 = 0
    let 平均値 = 平均(ソース)
    for value in ソース {
        let a = pow(Double(Double(value) - Double(平均値)), 2)
        sum1 += Int32(a)
    }
    let hoge = Double(sum1)/Double(ソース.count)
    return sqrt(hoge)
}
母集団の標準偏差(Aチーム得点)
母集団の標準偏差(Bチーム得点)
母集団の標準偏差(Cチーム得点)


/*!
@abstract   標本の標準偏差
*/
func 標本の標準偏差(ソース:Array<Int>) -> Double {
    var sum1:Int32 = 0
    let 平均値 = 平均(ソース)
    for value in ソース {
        let a = pow(Double(Double(value) - Double(平均値)), 2)
        sum1 += Int32(a)
    }
    let b = ソース.count - 1
    let hoge = Double(sum1)/Double(b)
    return sqrt(hoge)
}
標本の標準偏差(Aチーム得点)
標本の標準偏差(Bチーム得点)
標本の標準偏差(Cチーム得点)

/*!
* @abstract 階級の個数を求める
*/
func 階級の個数(個数:Int) -> Double {
    let numOfData = 個数
    let elem1 = log10(Double(numOfData))
    let elem2 = log10(2.0)

    let resultDouble = 1 + elem1/elem2
    return ceil(resultDouble)
}

階級の個数(50)
階級の個数(100)
階級の個数(200)
階級の個数(6)
階級の個数(Aチーム得点.count)

/*!
* @abstract 階級の幅を求める
*/
//func 階級の幅(ソース:Array<Int>) -> Int {
//    let maxValue = Double(maxElement(ソース))
//    let minValue = Double(minElement(ソース))
//    let elem3 = 階級の個数(ソース.count)
//
//    var ret:Double = 0
//    
//    if(elem3 > 0) {
//        ret = (maxValue - minValue) / elem3
//    }
//    
//    return Int(ceil(ret))
//}
//階級の幅(Aチーム得点)

/*!
@abstract   偏差値
*/

