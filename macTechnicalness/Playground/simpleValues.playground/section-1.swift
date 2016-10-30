// Playground - noun: a place where people can play

//import Cocoa

let str = "Hello, Test"

print(str)

let floatValue: Float = 7.014
let explicitFloat: Float = 4

//let value1: Int
var value2: Int


/************************************************
値の型は自動で変換されることはない。明示的に変換を行う。
*************************************************/
let labelText = "The width is "
let width = 94

let widthLabelText = labelText + String(width)

var hogeIntegerValue = 5
hogeIntegerValue = 256


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

//空の配列を作る
let emptyArray0 = Array<Int>()
let emptyArray = [String]()

//空の辞書を作る
var emptyDictionary0 = Dictionary<String, Float>()
let emptyDictionary = [String: Float]()

//配列の初期化
shoppingList = []


/*!
* @abstract optional typeの例
*/
var sampleValue1:Int?

//定数として、optional値を宣言。通るけど、二度と変更できない。
let sampleValue2:Int?
//sampleValue2 = 1

sampleValue1 = 100




