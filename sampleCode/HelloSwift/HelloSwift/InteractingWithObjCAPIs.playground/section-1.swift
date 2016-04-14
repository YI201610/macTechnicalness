// Playground - noun: a place where people can play

import UIKit

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
@abstract
*/
var myObj: AnyObject = UITableViewCell()

/*!
@abstract
*/
myObj = NSDate()


/*!
@abstract
*/
let futureDate: AnyObject = myObj.dateByAddingTimeInterval(1000)
let timeSinceNow = myObj.timeIntervalSinceNow


/*!
@abstract
*/
let myCount = myObj.count?

/*!
@abstract
*/
let myChar = myObj.characterAtIndex?(5)


/*!
@abstract
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

/*!
@abstract
*/
let myDate2 = lastRefreshDate as NSDate
let timeInterval = myDate2.timeIntervalSinceReferenceDate


/*---------- Working with nil -----------*/


