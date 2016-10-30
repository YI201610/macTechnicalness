// Playground - noun: a place where people can play

import UIKit

/*=============== Closures { } ==============

SwiftにおけるClosuresは、CやObjective-CにおけるBlocksに似ている。

Closuresは、定数や、変数につっこむことができる。

関数は、Closuresの特別な形であると言える。

・グローバル関数は、名前を持ち、どのような値も「キャプチャはしない」、Closuresである。
・ネストされた関数は、名前を持ち、そのネストされた関数を包んでいる関数から、「キャプチャされ得る」Closuresである。
・Closures表現は、名前のないClosuresで、それを取り巻くコンテキストにおいて、キャプチャされうるものである。

SwiftにおけるCosures表現は、無駄がなく、簡素で、簡潔さをうながし、整頓された文法になっている。

３つの簡潔さの促進とは、以下のようなことだ。
    ・パラメーターや返却値の型が、推量されること
    ・単一表現によるClosuresは、暗黙に帰ること。
    ・簡略化された引数
    ・たなびくClosure表現
*/

/*!
@abstract   Closure Expressions

ネストされた関数っていうのは、大きな関数に含まれる、自己内包的なコードので、都合のいいやり方だ。
*/

/*!
@abstract   The Sorted Function
            まず、ソート関数はこう書ける。
*/
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}
var reversed = sorted(names, backwards)

/*!
@abstract   Closure Expression Syntax
            Closuresの構文をつかえば、こうかける。
*/
reversed = sorted(names, { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

reversed = sorted(names, { (s1: String, s2: String) -> Bool in return s1 > s2 } )


/*!
@abstract   Inferring Type From Context
            Closureは、型推論に対応している
*/
reversed = sorted(names, { s1, s2 in return s1 > s2 } )



/*!
@abstract   Implicit Returns from Single-Expression Closures

            return文も、省略できる。
*/

reversed = sorted(names, { s1, s2 in s1 > s2 } )



/*!
@abstract   Shorthand Argument Names
            パラメータ名さえも、省略できる。
*/

reversed = sorted(names, { $0 > $1 } )


/*!
@abstract   Operator Functions
            省略した書き方ができる、というもの
*/
reversed = sorted(names, <)


/*!
@abstract   Trailing Closures

            Trailingクロージャ表現とは、クロージャを関数の最後のパラメータとして渡す時に、
            渡すクロージャが長すぎる場合に用いると便利かもしれない、１つの実装方法のこと。
*/

/*
@comment    trailing closureを表現するために、パラメーターにクロージャをとるサンプル関数を定義
*/
func someFunctionThatTakesAClosure(closure: () -> String) {
    // function body goes here
    print("クロージャを受け取る関数を実行した結果: " + closure())
}


/*
@comment    trailingクロージャを使用せずに関数を実行。
*/
someFunctionThatTakesAClosure({
    // trailing closureの、Body部
    return "Closures Body1"
})


/*
@comment    trailingクロージャ表現により、関数を実行。
*/
someFunctionThatTakesAClosure() {
    // trailing closureの、Body部
    return "Closures Body2"
}


func someFunctionThatTakesAClosure2(closure: () -> ()) {
}

someFunctionThatTakesAClosure2({
    
})

someFunctionThatTakesAClosure2() {
    
}

someFunctionThatTakesAClosure2 { () -> () in
    
}

/*
@comment    クロージャを引数に受け取る関数のパラメータがクロージャのみの場合、
            その関数の実行の際には、丸括弧（）を記述する必要はない。
*/
someFunctionThatTakesAClosure2 {
    
}


/*
@comment    上述のsorted関数を、trailing clousre表現で書くとこうなる。
            trailing closureとして、関数の丸括弧のそとにclosureを書くことができる。
*/
reversed = sorted(names, { $0 > $1 } )  //normal

reversed = sorted(names) { $0 > $1 }    //trailing closure表現で実装


/*
@comment    数字キーに対して文字列がアサインされた辞書
*/
let digitNames = [
    0: "Zero",
    1: "One",
    2: "Two",
    3: "Three",
    4: "Four",
    5: "Five",
    6: "Six",
    7: "Seven",
    8: "Eight",
    9: "Nine"
]

/*
@comment    数字のテストデータ配列
*/
let numbers = [16, 58, 510]


/*
@comment    trailingクロージャ表現で実装している例。
            mapエクステンションで、数字のデータを文字列にマッピング
            ※ mapメソッドは、１つのクロージャを引数にとる仕様なので、丸括弧を省略し、trailing Closure表現でクロージャを実装できる。
*/
let strings = numbers.map { (var number) -> String in

    var output = ""
    
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    
    return output
}
strings


/*
@comment    mapメソッドを、trailing closure表現を用いずに実行している例。
*/
let stringHoge3 = numbers.map({(var number) -> String in

    return ""
})
stringHoge3



/*!
@abstract   Capturing Values
*/

func makeIncrementor(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    
    return incrementor
}


let incrementByTen = makeIncrementor(forIncrement: 10)

incrementByTen()
incrementByTen()
incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementor(forIncrement: 7)
incrementBySeven()


incrementByTen()


/*!
@abstract   Closures Are Reference Types
*/


let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()



/*!
@abstract
*/
var array = [3,2,5,4]
array.sort{$0 < $1}
array


/*!
@abstract
*/
let array2 = [0,1,2,4,5,5,6,7, 8, 256]
let filteredArray = array2.filter{ $0 % 3 == 0 }
filteredArray


/*!
@abstract
*/
let array3 = [1,2,3,4,5,6,7,8]

let someValueArray = array3.map{ $0 * 10}
someValueArray
