// Playground - noun: a place where people can play

import Foundation

var Aチーム得点 = [80, 56, 43, 92, 65, 35, 72, 55, 33, 33, 33]
var Bチーム得点 = [99, 12, 35, 70, 57, 43, 22]
var Cチーム得点 = [11, 22, 33, 44, 55, 66, 77, 0]

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
平均(Aチーム得点)
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
        var 候補IDX = Int(countOfSource/2)-1
        var 候補IDX2 = 候補IDX+1
        
        var value1:Float = Float(ソース[候補IDX])
        var value2:Float = Float(ソース[候補IDX2])
        
        var hoge:Float = (value1 + value2)/2

        return hoge //Float(ソース[idx] + ソース[候補IDX2])
    }else{
        /*
        @comment    奇数の場合
        */
        候補IDX = ceil(Float(countOfSource/2))-1
        /*
        @comment    index0から配列データがあるので、四捨五入した値を-1
        */
        idx = Int(候補IDX)
        return Float(ソース[idx])
    }
}
中央値(Aチーム得点)
中央値(Bチーム得点)
中央値(Cチーム得点)


/*!
@abstract   標準偏差
*/


/*!
@abstract   偏差値
*/

