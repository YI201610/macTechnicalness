// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


var stri = "Hello, playground, hello"

//定数宣言
let a = 10 + 30

//変数宣言
var b = 0

var x = 1.0, y = 3.0, z = 3.0


var welcomeMessage: String


b

welcomeMessage = "This is TEST. "

welcomeMessage = "hogehgoe"

welcomeMessage

//var c: Integer

//*********************
//和名の変数名を使える
//*********************
let d = 3.14159
let 求人コード = "あいうえお"

let 業務ID = "日本語を使用することができます"
業務ID

println(業務ID)
println("This is println() String...")
println("出力テスト")

println("from Macbook Pro")


/************************************
コメント記述。
************************************/
let dog = "🐶"
println(dog)

let minValue = UInt8.min
let maxValue = UInt8.max


let implicitInteger = 70
let implicitDouble = 70.0

//let explicitDouble: Double = 70
let explicitDouble: Double = 70.12341324123

/************************************************
変数の型は自動で変換されることはない。明示的に変換を行う。
*************************************************/
let labelText = "The width is "
let width = 94

let widthLabelText = labelText + String(width)



//----------------------------------
// 変数を()でくくり、＼を括弧の前に書いて、文字列に変数を連結できる
//----------------------------------
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let orangeSummary = "I have \(oranges) oranges."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."


/*====================================
配列やディクショナリは、ブランケット[]を使用して表現し、インデックスやキー名を用いてアクセスしよう。
=====================================*/

var shoppingList = ["catfish", "fish", "water", "tulips", "blue paint", "グリーンの絵の具"]
shoppingList[2] = "bottle of water"

var occupations = [
    "ひろし" : "チームリーダー",
    "とおる" : "接客",
    "かなこ" : "管理",
]

occupations["もりもと"] = "医療事務"


/*=====================================
空の配列や、空の辞書を宣言する
=====================================*/

//let emptyArray = String[]()
let emptyDictionary = Dictionary<String, Float>()

shoppingList = []       //配列の初期化


/****************************************
コントロールフロー

if, for-in
*****************************************/
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0;

for score in individualScores {
    
    if score > 50 {
        teamScore += 3
    }else {
        teamScore += 1
    }
    
}
teamScore


/**************************************
if文と、letと、optional value
**************************************/
var optionalString: String? = "This is optionalStirng..."
optionalString == nil

var optionalName: String? = nil  //"Yuji Imamura"
var greeting = "Hello!"

//失われているかもしれない値を条件文で使用するときは、letを使用する
if let name = optionalName {
    greeting = "Hello, \(name)"
}else{
    greeting = "Hello, \(optionalString)"
}

greeting



