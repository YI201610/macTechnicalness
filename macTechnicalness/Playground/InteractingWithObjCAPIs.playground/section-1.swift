// Playground - noun: a place where people can play

import UIKit
import Foundation

/*!
@abstract   初期処理例
*/
let sampleTableView: UITableView = UITableView(frame: CGRectZero, style:.Grouped)

/*!
@abstract   初期処理例
*/
let aTextField = UITextField(frame: CGRect(x: 0.0, y: 0.0, width: 200.0, height: 40.5))

/*!
@abstract   初期処理例
*/
let someColor = UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0)


/*!
@abstract   失敗する可能性がある初期化処理
*/
if let fileContents = NSString(contentsOfFile: "sampleText.md", encoding: NSUTF8StringEncoding, error: nil) {
    println(fileContents)
}else{
    println("The file is not available!")
}


/*!
@abstract   プロパティーにアクセス
*/
aTextField.textColor = someColor
aTextField.text = "こんちわ"


/*!
@abstract   メソッドを使う
*/
sampleTableView.insertSubview(aTextField, atIndex: 2)
sampleTableView.layoutIfNeeded()


/*---------- id Compatibility -----------*/

/*!
@abstract   AnyObjectは、untypedなObjオブジェクトを、タイプセーフなSwiftコードで取り扱えるようにする（ただし、Obj-CからSwiftに移行中）

    Swiftは、idオブジェクトを、AnyObjectとして取り込む
*/
var myObj: AnyObject = UITableViewCell()

/*!
@abstract   AnyObject型の変数には、すでに入っているオブジェクトとは異なる型のオブジェクトをつっこむことができる。
*/
myObj = NSDate()


/*!
@abstract   AnyObject型になったObj-Cオブジェクトのプロパティやメソッドは、特別なキャストをしなくても、使用することができる
*/
let futureDate: AnyObject = myObj.dateByAddingTimeInterval(1000)
let timeSinceNow = myObj.timeIntervalSinceNow


/*!
@abstract   AnyObjectの中に入るものは、実行時にしかわからないので、
            不注意に安全ではないコードになる可能性がある。

            それは、つまり、「ランタイムエラー」だ。

            ランタイムエラーを抑止することができるのは、optionalsを活用するという考え方だ。

            AnyObject型にはいってるObj-Cオブジェクトのメソッドを実行したとき、
            そのメソッドを実行することは、実際には、暗黙にunwrapped optional値を取り扱うかのように作用する。

            上述ようなドットでメソッドをコールする文法は、AnyObjectのメソッドやプロパティを実行したいときに、使用できる。

*/

/*!
@abstract   次のメソッドは、２行とも実行されない。理由は、NSDate型のmyObjectには、countメソッドも、characterAtIndexメソッドも備わっていないから
*/
/*
@abstract    myCountは、型推論により、optional Int型として扱われる。
            実際、myObj(現時点、NSDate型)はcountメソッドを備えていないので、myCountにはnilが入る。
*/
let myCount = myObj.count?

/*
@abstract    myCharは、型推論により、optional char型として扱われるけど、
            myObjは、characterIndexを備えていないため、myCharには、nilが入る。
*/
let myChar = myObj.characterAtIndex?(5)

/*
@abstract    結果が保証されないメソッドの戻り値を条件付きで「unwrap（AnyObject型に入っているObj-Cメソッドを実行することは、実際には、暗黙にunwrapped optional値を取り扱うかのように作用する）」するときには、
            if-let文を使うことができる。

            AnyObject型のオブジェクトから、より具体的なオブジェクトにキャストするっていうのは、
            その変換が成功するかどうか保証されないということ。

            なので、その場面で得たoptional値は、下記のようにif-let文できちんと成功しているかチェックすることができる。
*/
if let hogeChar = myObj.characterAtIndex?(1000) {
    println("hogeChar: \(hogeChar)")
}

let userDefaults = NSUserDefaults.standardUserDefaults()
userDefaults.setValue(NSDate(), forKey: "lastRefreshDate")

let lastRefreshDate: AnyObject? = userDefaults.objectForKey("lastRefreshDate")

if let aDate = lastRefreshDate as? NSDate {
    println("hoge: \(aDate.timeIntervalSinceReferenceDate)")
}

/*
@abstract 　as演算子を使用して、メソッドの実行を強行する書き方もできる。
*/
let myDate2 = lastRefreshDate as NSDate
let timeInterval = myDate2.timeIntervalSinceReferenceDate


/*---------- Working with nil -----------*/


