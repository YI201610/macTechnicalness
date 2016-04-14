// Playground - noun: a place where people can play

import Cocoa

/*!
@abstract   プロトコルを宣言するには、protocolキーワードを使用します。
*/
protocol SampleProtocol {
    var hogeDescription: String {get}
    mutating func adjust()
}


/*!
@abstract   サンプル・プロトコルを実装するサンプル・クラス
*/
class SampleClass: SampleProtocol {
    var hogeDescription: String = "初期値"
    var anotherProperty: Int = 07007055;

    /*!
    @abstract   プロトコルメソッドの実装
    */
    func adjust() {
        hogeDescription += "(add)"
    }
}

/*!
@abstract   プロトコルを実装した、SampleClassを動作させる。
*/
var a = SampleClass()
a.adjust()
a.adjust()

let tmpValue = a.hogeDescription



//
extension Int: SampleProtocol {
    var hogeDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
7.hogeDescription
//7.adjust()



