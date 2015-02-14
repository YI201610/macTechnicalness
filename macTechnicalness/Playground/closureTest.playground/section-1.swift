// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

var numbers = [13, 340, 15, 13, 210, 50, 15]

//****************************
//クロージャを使える
//****************************
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
    })

numbers.map({number in 4 * number})

sort([1,5,3,12,2]){$0 > $1}

