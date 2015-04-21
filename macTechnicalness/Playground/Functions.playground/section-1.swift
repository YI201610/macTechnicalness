// Playground - noun: a place where people can play

import UIKit

/*!

言語が思考を規定する　〜出典不明〜

@abstract   Functions

・C風の関数は表現するのに十分な表現力をもっている
・パラメーターはデフォルト値を定めることができる

・「in-out パラメーター」にもなれる。

・全てのSwift関数は、型をもつ（パラーメータ、戻り値）
→　このおかげで、値や関数間の受けわたしが容易になる。

・関数の中に関数を作れる
*/


/*!
-----------------------------------------------
@abstract   Defining and Calling Functions
-----------------------------------------------
*/
func sayHello(personName: String) -> String {
    let greeting = "Hello, " + personName + "!"
    return greeting
}

println(sayHello("テスト"))
println(sayHello("iOS"))


func sayHelloAgain(personName: String) -> String {
    return "Hello, again, " + personName + "!"
}

println(sayHelloAgain("ほげアプリ"))



/*!
-----------------------------------------------
@abstract   Function Parameters and Return Values
-----------------------------------------------
*/

//Multiple Input Parameters: 複数のパラメーター

func ２点間の距離(start: Int, end:Int) -> Int {
    return end - start
}

println(２点間の距離(234, 1000))


//Functions Without Parameters: パラメータをもたない関数

func sayHelloWorld() -> String {
    return "Hello, world!"
}
sayHelloWorld()


//Functions Without Return Values: 戻り値がない関数

func sayGoodbye(personName: String) {
    println("Goodbye, \(personName)")
}
sayGoodbye("サンプルさん")

//The return value of a function can be ignored when it is called.
func printAndCount(someString: String) -> Int {
    println(someString)
    return count(someString)
}
printAndCount("ほげほげ")

func printWithoutCounting(someString: String) {
   
    /*
    @comment    戻り値を、無視する
    */
    printAndCount(someString)
}
printWithoutCounting("ほげお")


//Functions with Multiple Return Values: 複数の戻り値がある関数
func minAndMax(someArray: [Int]) -> (min: Int, max: Int) {

    /*
    @comment 　入力配列の先頭要素で最小値と最大値を初期化します。
    */
    var currentMin = someArray[0]
    var currentMax = someArray[0]
   
    /*
    @comment    先頭から２番目の要素から、入力配列の最後の要素までの間で、最小値と最大値を求めます。
    */
    for value in someArray[1 ..< someArray.count] {
        if value < currentMin {
            currentMin = value
        }else if value > currentMax {
            currentMax = value
        }
    }
   
    /*
    @comment    入力配列における最小値と最大値を返します。
    */
    return (currentMin, currentMax)
}

let minMaxResult = minAndMax([10, 20, 13, 125, 265, 28282, -2])
println(minMaxResult.min)   //最小値
println(minMaxResult.max)   //最大値


//Optional Tuple Return Types: nilかもしれないタプルを返す関数

func minAndMax2(someArray: [Int]) -> (min: Int, max: Int)? {
   
    /*
    @comment 　入力配列の先頭要素で最小値と最大値を初期化します。
    */
    var currentMin = someArray[0]
    var currentMax = someArray[0]
   
    if currentMin == 5 {
        return nil
    }
   
    /*
    @comment    先頭から２番目の要素から、入力配列の最後の要素までの間で、最小値と最大値を求めます。
    */
    for value in someArray[1 ..< someArray.count] {
        if value < currentMin {
            currentMin = value
        }else if value > currentMax {
            currentMax = value
        }
    }
   
    /*
    @comment    入力配列における最小値と最大値を返します。
    */
    return (currentMin, currentMax)
}

if let result2 = minAndMax2([85, 365, 12, 8, -16, 256, 128, 16]) {
    println("min: \(result2.min), max: \(result2.max)")
}

if let result3 = minAndMax2([5, 365, 12, 8, -16, 256, 128, 16]) {
    println("min: \(result3.min), max: \(result3.max)")
}else{
    println("nilが返された!")
}


/*!
-----------------------------------------------
@abstract   Function Parameter Names
-----------------------------------------------
*/

//External Parameter Names: 対外的なパラメータ名称をつけることができる
func someFunction(対外的なパラメータ名称 localパラメータ名: Int) -> String {
    return "Yeah!!: \(localパラメータ名)"
}
someFunction(対外的なパラメータ名称: 1325) //このようにソースコードを文書化できる

/*
@comment    対外的なパラメーターの例
*/
func superJoin(入力文字列1 s1:String, 入力文字列2 s2:String, 区切り文字 joiner:String) -> String {
    return s1 + joiner + s2
}
superJoin(入力文字列1: "google", 入力文字列2: "yahoo", 区切り文字: " vs ")


//Shorthand External Parameter Names: 対外的なパラメーターを省略しつつ、対外的なパラメーターを設けたい場合
func 文字を含むかな(#someString: String, #someCharaToFind: Character) -> Bool {
    for a_character in someString {
        if a_character == someCharaToFind {
            return true
        }
    }
   
    return false
}
文字を含むかな(someString: "goooogle", someCharaToFind: "o")



//Default Parameter Values: パラメーターにはデフォルト値を設けることができる
func hyperJoin(入力文字列1 s1:String = "AAA", 入力文字列2 s2:String = "BBB", 区切り文字 joiner:String = " & ") -> String {
    return s1 + joiner + s2
}
hyperJoin()
hyperJoin(入力文字列1: "わーーー")
hyperJoin(入力文字列2: "ふーーー")
hyperJoin(区切り文字: "@@@")

//External Names for Parameters with Default Values: デフォルト値をもつパラメーターにおける「対外的なパラメータ名」

/*
@comment
*/
func miracleJoin(s1:String = "DDD", s2:String, joiner:String = " ¥ ") -> String {
    return s1 + joiner + s2
}
//miracleJoin("a") ... Error！Swiftは、デフォルト値をもつパラメーターには自動で「対外的なパラメータ名」を作成する。
miracleJoin(s1: "a", "b")



//Variadic Parameters: 可変個パラメータ
func 平均(someNumbers: Double...) -> Double {
    var total: Double = 0
   
    for a_number in someNumbers {
        total += a_number
    }
   
    return total / Double(someNumbers.count)
}
平均(1,2, 256.28, 3.14, 08, 81, 1348, 585,5)


//Constant and Variable Parameters: 渡ってきた関数のパラメータは「定数」変えようとするとエラーになる。入力パラメータの先頭に「var」キーワードをつけることで、変更可能になる。
var someString = "a"
func 指定した文字数まで特定文字で埋める(var someString: String, countValue:Int, padChar: Character) -> String {
    let amountToPad = countValue - count(someString)
   
    /*
    @comment    指定された文字数よりも、渡された文字列が短い場合、何もせずに、渡された文字列を返します。
    */
    if amountToPad < 1 {
        return someString
    }
   
    /*
    @comment    処理する型を揃えるために、char型からString型を作成
    */
    let padString = String(padChar)

    /*
    @comment    指定された文字数まで、padCharで埋める。
    */
    for _ in 1...amountToPad {
       
        /*
        @comment (!)入力されたパラメータを変更している！
        */
        someString = padString + someString
    }
   
    /*
    @comment    更新された「入力パラメータ」を返す
    */
    return someString
}
指定した文字数まで特定文字で埋める("AAA", 10, "_")
someString


//In-Out Parameters: inoutパラメータを使えば、関数の処理が終わった後も、関数内で行った処理が効いている
var a = 10
var b = 20
func swapToInts(inout a: Int, inout b:Int) {
    let tempA = a;
    a = b
    b = tempA
}
swapToInts(&a, &b)
a
b


/*!
-----------------------------------------------
@abstract   Function Types
-----------------------------------------------
*/

/*
@comment   関数型： ２つのIntをパラメータに受け取り、Intを返す
*/
func addTwoInts(a: Int, b:Int) -> Int {
    return a + b
}

/*
@comment   関数型： ２つのIntをパラメータに受け取り、Intを返す
*/
func multTwoInts(a: Int, b: Int) -> Int {
    return a * b
}

//Using Function Types: 同じ「型」の関数を代入できる
var someMathFunc: (Int, Int) -> Int = multTwoInts
someMathFunc(5,5)


/*
@comment    型推論を期待して、関数をbbbFunc変数に代入
*/
var bbbbFunc = addTwoInts


//Function Types as Parameter Types: パラメータの型としての、関数型
func 計算結果を出力する(mathFunction:(Int,Int)->Int, a:Int, b:Int) {
    println("計算結果: \(mathFunction(a,b))")
}
計算結果を出力する(bbbbFunc, 10, 20)


//Function Types as Return Types: 「（関数）戻り値の型」としての関数型

func funcA(inputValue: Int) -> Int {
    return inputValue + 1
}

func funcB(InputValue: Int) -> Int {
    return InputValue - 1
}

func 関数を選択する(flag: Bool) -> (Int) -> Int {
    return flag ? funcA : funcB
}

var someValue = 20
let 何かの計算結果 = 関数を選択する(someValue > 25)   //わざと、funcB（減算）がひっかかるように判定を書いている

/*
@comment    someValueが0になる直前まで（減算し続ける）
*/
while someValue != 0 {
    someValue = 何かの計算結果(someValue)
    println(someValue)
}


/*!
-----------------------------------------------
@abstract   Nested Functions
-----------------------------------------------
*/

func 関数を選択するVer2(flag: Bool) -> (Int) -> Int {
    func localFuncA(hoge: Int) -> Int {
        return hoge+20
    }
    
    func localFuncB(hoge: Int) -> Int {
        return hoge+1
    }
    
    return flag ? localFuncA : localFuncB
}

var somethingValue = 100
for i in 1 ... 10 {
    let hogeFunction = 関数を選択するVer2(i % 2 == 1)
    somethingValue = hogeFunction(somethingValue)
}


