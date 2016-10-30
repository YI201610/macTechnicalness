// Playground - noun: a place where people can play

import Cocoa

/*!
@abstract   Enum型は、必ず型を指定して作成する。
*/
enum SampleEnumRanking: Int {
    case One = 1
    case Two, Three, Four, Five

    /*!
    @abstract   SwiftにおけるEnum型は、関数を実装することができる。
    */
    func hogeAction() -> String {
        switch self {
        case .One:
            return "func::One"
            
        case .Two:
            return "func::Two"
            
        default:
            return String(self.toRaw())
        }
    }
}

let hoge = SampleEnumRanking.Two
let gooo = hoge.toRaw() //Enum型から実値に変換
print(hoge.toRaw())

let foo = SampleEnumRanking.hogeAction(hoge)

let yaaa = SampleEnumRanking.Five
let yooo = yaaa.toRaw() //Enum型から実値に変換

/*!
@abstract   toRaw()や、fromRawを用いて、Enum型と実値との間で変換を行うことができる。
*/
if let convertedRank = SampleEnumRanking.fromRaw(1) {
    let threeDescription = convertedRank.hogeAction()
}

if let convertedRank = SampleEnumRanking.fromRaw(2) {
    let threeDescription = convertedRank.hogeAction()
}

/*!
@abstract   if文の中でletを使用することができる。
*/
if let convertedRank = SampleEnumRanking.fromRaw(10000) {
    let threeDescription = convertedRank.hogeAction()
}

