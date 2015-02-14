/*!
@abstract 一重和
iはダミー変数
*/
var m: UInt64 = 0
for i in 1..<20 {   //ダミー変数i
    let k = i*i*i   //iの３乗を計算する
    k
    m = m + k
}
m

/*!
@abstract 二重和
*/
for i in 0..<10 {
    for j in 0...10{
        var n = i+j
        n
    }
}

/*!
@abstract 三重和
*/
for h in 0..<5 {
    for i in 0...5 {
        for j in 0...5{
            let hoge = h+i+j
            hoge
        }
    }
}

/*!
@abstract クロネッカーのデルタ
    iとjが等しければ1、異なっていれば0を返す
 */
func クロネッカーのデルタ(i:Int, j:Int) -> Int {
    if i == j {
        return 1
    }else{
        return 0
    }
}


/*!
@abstract クロネッカーデルタの関わる和の基本的な性質
*/
func クロネッカーデルタの関わる和の基本性質１(M:Int, j:Int) -> Int {
    var sigma = 0
    for i in 1...M {
        let クロネッカーデルタ判定結果 = クロネッカーのデルタ(i, j)
        sigma += クロネッカーデルタ判定結果
    }
    return sigma
}
let result = クロネッカーデルタの関わる和の基本性質１(4, 3)

let M = 15
for i in 1...20 {
    let hoge = クロネッカーデルタの関わる和の基本性質１(M, i)*5
}

