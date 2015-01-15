// Playground - noun: a place where people can play

//import Cocoa

let Aチーム得点 = [80, 56, 43, 92, 66, 35, 72]
let Bチーム得点 = [99, 12, 35, 70, 57, 43, 22]
let Cチーム得点 = [11, 22, 33, 44, 55, 66, 77]


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


/*!
@abstract   標準偏差
*/


/*!
@abstract   偏差値
*/

