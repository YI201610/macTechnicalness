// Playground - noun: a place where people can play

import Cocoa

/****************************************
関数
****************************************/

/*!
@abstract 挨拶する
*/
func greet(name:String, day:String) -> String {
    return "Hello \(name), today is \(day)."
}
println(greet("Yuji Imamura", "ランチ行こうぜ"))

/*!
@abstract　ガス料金を返す
*/
func getGasPrices() -> (Double, Double, Double) {
    return (12.34, 56.78, 3.14159)
}
getGasPrices()

/*!
@abstract 合計を返す
*/
func sumOf(numbers:Int ...) -> Int{
    var sum = 0
    
    for number in numbers {
        sum += number
    }
    return sum
}

sumOf(10, 2, 3, 55, 6)

/*
関数はネストできる
*/
func returnFifteen() -> Int {
    var y = 10
    
    func add(){
        y += 5
    }
    add()
    
    return y
}
returnFifteen()

/*!

関数は、a first-class typeである。

参考: 
http://stackoverflow.com/questions/599978/what-is-a-first-class-type

Q: What is a “First Class” type?
A: Usually it means instances of T can be

* returned from functions
* passed into functions
* constructed at runtime

Eg)functions in C are not first class types as they cannot be constructed at runtime, but they are in JavaScript.
*/
func makeIncrementer() -> (Int -> Int){
    
    func addOne(number: Int) -> Int {
        return 100 + number
    }
    return addOne
}
var increment = makeIncrementer()   //関数をincrement変数の中に代入
increment(7)



/*!
関数は、引数に、関数をもらえる
*/
func hasAnyMatches(integerlist: [Int], condition: Int -> Bool) -> Bool {
    
    //パラメータとして渡されたlist変数を捜査
    for item in integerlist {
        if condition(item){
            return true
        }
    }
    
    return false
}

//パラメータに渡す用の、判定関数を定義
func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [5, 340, 15, 13, 210, 50, 15]
hasAnyMatches(numbers, lessThanTen)
