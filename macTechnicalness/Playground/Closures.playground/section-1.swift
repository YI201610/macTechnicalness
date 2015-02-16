// Playground - noun: a place where people can play

import UIKit

/*=============== Closures ==============*/

/*!
@abstract   Closure Expressions
*/

/*!
@abstract   The Sorted Function
*/
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}
var reversed = sorted(names, backwards)

/*!
@abstract   Closure Expression Syntax
*/
reversed = sorted(names, { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

reversed = sorted(names, { (s1: String, s2: String) -> Bool in return s1 > s2 } )


/*!
@abstract   Inferring Type From Context
*/

reversed = sorted(names, { s1, s2 in return s1 > s2 } )



/*!
@abstract   Implicit Returns from Single-Expression Closures
*/

reversed = sorted(names, { s1, s2 in s1 > s2 } )



/*!
@abstract   Shorthand Argument Names
*/

reversed = sorted(names, { $0 > $1 } )


/*!
@abstract   Operator Functions
*/

reversed = sorted(names, >)


/*!
@abstract   Trailing Closures
*/



func someFunctionThatTakesAClosure(closure: () -> ()) {
    // function body goes here
}
// here's how you call this function without using a trailing closure:
someFunctionThatTakesAClosure({
    // closure's body goes here
})
// here's how you call this function with a trailing closure instead:
someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}

reversed = sorted(names) { $0 > $1 }

let digitNames = [
    0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map {
    (var number) -> String in
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}


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
// returns a value of 10
incrementByTen()
// returns a value of 20
incrementByTen()
// returns a value of 30

let incrementBySeven = makeIncrementor(forIncrement: 7)
incrementBySeven()


incrementByTen()


/*!
@abstract   Closures Are Reference Types
*/


let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()



