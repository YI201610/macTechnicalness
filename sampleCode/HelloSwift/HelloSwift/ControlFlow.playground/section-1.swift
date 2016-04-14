// Playground - noun: a place where people can play

import Cocoa

let individualScores = [75, 36, 103, 45, 77]
var teamScore = 0

//for-in文の例
for score in individualScores {
    
    //if文の例
    if score > 50 {
        teamScore += 3
    }else{
        teamScore++
    }
    
}
teamScore

//optionalString
//型の後に？マークを打つことで、その変数をoptionalなものとして宣言する
var optionalString: String? = "Hello, optional String"

//optional valueは、nilを持ちうる。
optionalString == nil

//optional valueに文字列を入れて初期化する
var optionalName: String? = "John Appleseed"
var greeting = "Hello!"

//if文の中でletを使うことができる
if let name = optionalName {
    greeting = "Hello, \(name)"
}
greeting


/*****************************************
switch文
*****************************************/

//let vegetable = "red pepper"
//let vegetable = "pepper hoge celery"
//let vegetable = "hoge celery pepper"
let vegetable = "cucumber"

switch vegetable {
    
case "celery":
    let vegetableComment = "コメントA"
    
case "cucumber", "watercress":
    let vegetableComment = "コメントB"
    
case let x where x.hasSuffix("pepper"): //評価する変数が、特定の接尾辞をもっているか？
    let vegetableComment = "コメントC: \(x)"
    
default:
    let vegetableComment = "コメントD"
    
}
//vegetableComment  ... このタイミングでは、vegetableCommentはスコープ対象外

//***************************************
//for-in ループ例
//***************************************
let interestingNumbers = [
    
    "Prime" : [2,3,5,7,11,13],  //素数
    "Fibonacci" : [1,1, 2,3,5,8],   //フィボナッチ
    "Square" : [1,4,9,16,25],
]

var largest = 0

for (kind, numbers) in interestingNumbers {
    
    for number in numbers {
        
        if number > largest {
            largest = number
        }
    }
    
}

largest


//***************************************
//while ループ例
//***************************************
var n = 2

while n < 100 {
    n *= 2
}
n


//***************************************
//do-while ループ例
//***************************************
var m = 2

do {
    m *= 2
}while m < 200
m


//**************************************
// .. 演算子
//**************************************
var firstForRoop = 0

for i in 0...3 {
    firstForRoop+=i
}
firstForRoop


var secondForRoop = 0
for var i = 0; i < 3; ++i {
    secondForRoop += 1
}
secondForRoop

