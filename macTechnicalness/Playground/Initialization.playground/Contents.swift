
/*
# Initialization

Initializationとは、クラス、構造体、列挙型に対する、準備の工程です。

この工程は、新しいインスタンスを使い始めるまえに、準備として、各インスタンス内のプロパティに初期値を与える工程に等しい。

初期化は、initializerを定義して行う。

initializerっていうのは、インスタンスを生成するときに呼ばれるもの。

Obj-Cのinitializerとちがって、SwiftのInitializerは、値を返さない。

SwiftにおけるInitializerの主な役割は、インスタンスが使われるまえに、確実に初期化されていることを保証することである。

あと、インスタンスは、deinitializerも定義することができる。deinitializerの役割は、インスタンスが破棄されるまえに、独自にクリーンアップ処理をすることにある。deinitializerの詳細は、"Deinitialization"の章で説明されている。



## Setting Initial Values for Stored Properties - プロパティに、初期値を設定する。

クラスや構造体のインスタンスには、作成するとき、必ずプロパティへの初期値を与えなければならない。

ストアードプロパティは、不確定な状態でいることができないのだ。

初期値を与えるには、initializerを使う方法と、定義時に、デフォルト値を設定する方法がある。

なお、initializerや、宣言時にデフォルト値を設定するとき、プロパティ監視の仕組みは機能しない。


### Initializers
### Default Property Values

initializerとは、とある型のオブジェクトを生成するときに実行されるものだ。

もっとも単純なケースでは、initializerは一つの引数も受け取らないもので、initキーワードを使用する。

イニシャライザを使用して初期値を設定することと、宣言時に初期値を設定すること、
どちらを使うべきか、というと、
なるべく、宣言時に初期値を与えるのが好ましい。

---
## Customizing Initialization


### Initialization Parameters

initializerには、メソッドのパラメーター宣言と同じ構文で、初期値用のパラメーターを供給することができる。

次の例では、カスタムイニシャライザを２つ実装している。

### Local and External Parameter Names

関数と同様に、initializerのパラメーターも、内向けの変数名と、外向きの名前を持つことがで
きる。

でも、initializerは、関数のように、イニシャライザ自体に名前をつけることはできない。

なので、イニシャライザのパラメーター名は、イニシャライザーを特定するために、重要な役目を
担う。

そんな訳で、Swiftでは、外向きのパラメーター名をプログラマーが付与しなければ、Swiftが外向
きのパラメーター名を自動で付与する。その外向きのパラメーター名は、内向きのパラメーターと
同じ名前になる。

さて、ここで、Colorという構造体を考える。

ところで、次の文は、エラーになる。

let veryGreen = Color(0.0, 1.0, 0.0)
// this reports a compile-time error - external names are required

理由は、外向きのパラメータ名を書かずに、イニシャライザを使用しているからだ。


*/

/*
@comment
*/
struct 摂氏 {
    var 温度: Double
    var mode = 256	//このように、宣言時に初期値を与えることもできる
    
    /*
    @comment    イニシャライザ
    */
    init() {
        温度 = 36.7
    }
}

var a = 摂氏()
a.温度

/*
@comment
*/
struct Celsius0 {
    
    var temperatureInCelsius: Double
    
    /*
    @comment    カスタムイニシャライザー　その１
    */
    init(ファーレンハイト fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    /*
    @comment    カスタムイニシャライザー　その２
    */
    init(ケルビン kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}


var b = Celsius0(ケルビン: 3.14)
var c = Celsius0(ファーレンハイト: 3.14)


/*
@comment

### Initializer Parameters Without External Names

イニシャライザーに、外向きのパラメーター名をつけたくない場合は、_（アンダースコア）を使用する。

*/

struct Celsius {
    
    var temperatureInCelsius: Double
    
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}

/*
@comment    このように、場合によっては、外向きのパラメーター名を付与しないInitializerの方が、明確で分かり易かったりする。
*/
let bodyTemperature = Celsius(37.0)



/*
@comment    ### Optional Property Types

初期化時に決定できないプロパティがある型では、オプショナルなプロパティを宣言できる。
*/

class SurveyQuestion {
    
    var text: String
    
    /*
    @comment    optionalなプロパティは、nilがつっこまれる＝まだ初期化してないんだよ、というメッセージになり得る。
    */
    var response: String?

    init(text: String) {
        self.text = text
    }
    
    func ask() {
        println(text)
    }
}

/*
@comment    このように、responseには、nilが入っている。
*/
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()

cheeseQuestion.response = "Yes, I do like cheese."





/*
@comment    ### Assigning Constant Properties During Initialization

クラスのプロパティに定数値を入れる場合、initializer

*/


class SurveyQuestion2 {

    let text: String
    var response: String?
    
    init(text: String) {
        self.text = text
        
        //Error. 一度だけ initializeできる。
//        self.text = "hogehoge"
    }
    
    func ask() {
        println(text)
    }
}

let beetsQuestion = SurveyQuestion2(text: "How about beets?")
beetsQuestion.ask()
// prints "How about beets?"
beetsQuestion.response = "I also like beets. (But not with cheese.)"
beetsQuestion.text

//Error. 定数は変更できない。
//beetsQuestion.text = "hoge"



/*
@comment    ## Default Initializers

Swiftでは、デフォルトinitializerというものがある。

プロパティ宣言時に、初期値を与えさえすれば、initializerの実装を省略することができる。
*/

class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

/*
@comment    デフォルトinitializerを使用してインスタンスを作成すると、そのインスタンスのプロパティは、全て、デフォルト値で初期化されている。
*/
var item = ShoppingListItem()
//var item2= ShoppingListItem(name: "", quantity: 1, purchased: true)


/*
@comment    Error. 初期値を与えていないクラスのコンパイルは、initializerを実装しない限り、通らない
*/
//class noDefalutValueClass{
//    var name
//}

/*
@comment    ### Memberwise Initializers for Structure Types

構造体型は、プロパティ宣言時に、デフォルト値を宣言すれば、
initializerの実装を省略できる。
*/

struct Size0 {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size0(width: 2.0, height: 2.0)
let hogeObj = Size0()


/*
@comment    構造体は、プロパティに、初期値を与えなくても、initializerを実装しなければ、memberwise initializerが発動する。

この仕組みは何が便利かっていうと、構造体のインスタンスを作成するときに、メンバープロパティ分を考慮した、initializerの実装を省略できるから便利だということ。
*/
struct Size2 {
    var width: Int
    var height: Int
}

let size2Inst = Size2(width: 10, height: 20)
//let size3Int = Size2()


/*
@comment    ---
## Initializer Delegation for Value Types

initializerで、他の型のinitializerを実行することを、initializerデリゲーションと呼ぶ。
*/


/*
@comment    構造体や、列挙型のinitializerデリゲーションは、継承の概念がないので、シンプル。

ここでは、構造体を例にあげる。
*/
struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    
    var origin = Point()
    var size = Size()
    
    init() {}
    
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
    
        /*
        @comment    自身の型における、別のinitializerを使用したい場合は、selfキーワードを使用する。
        */
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}


/*
@comment    １番目のinitializerを使用する
*/
let basicRect = Rect()
// basicRect's origin is (0.0, 0.0) and its size is (0.0, 0.0)

/*
@comment    ２番目のinitializerを使用する
*/
let originRect = Rect(origin: Point(x: 2.0, y: 2.0),
    size: Size(width: 5.0, height: 5.0))

// originRect's origin is (2.0, 2.0) and its size is (5.0, 5.0)

/*
@comment    ３番目のinitializerを使用する
*/
let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
    size: Size(width: 3.0, height: 3.0))
// centerRect's origin is (2.5, 2.5) and its size is (3.0, 3.0)




/*
@comment
#######################################################
## Class Inheritance and Initialization

クラスは、プロパティをもつものなんだけど、
継承している場合、親のクラスのプロパティも含めて、全て初期化されなければならない。

Swiftにおけるクラスのinitializer実装の方法は、２つある。

１つは、指定 initializer（デザグニート[dézɪgnèɪt]initializer）
２つめは、コンビニエンスinitializer
*/

/*
@comment    ### Designated Initializers and Convenience Initializers

クラスは、少なくとも、１つの指定 initializerを実装する必要がある。

上記で説明してきたinitializerは、指定 initializer.

コンビニエンス initializerは、指定initializerを使用することをサポートする仕組み。
コンビニエンス initializerを実装することは、必須ではない。

コンビニエンス initializerは、指定initializerを実行しなければならない。

※コンビニエンス initializerと、指定initializerの関係をシンプルにするために、
Swift言語では３つのルールを定めている。

※図


*/



/*
@comment    ### Syntax for Designated and Convenience Initializers
*/

/*
@comment    ### Initializer Delegation for Class Types

コンビニエンス initializerと、
*/

/*
@comment    ### Two-Phase Initialization

Swift言語には、Two-Phase Initializationという仕組みがあって、これが、初期化処理を安全なものにしている。

※説明はまた今度。

*/

/*
@comment    ### Initializer Inheritance and Overriding

Objective-Cと異なり、Swiftの子クラス（サブクラス）は、親クラス（スーパークラス）のinitializerをデフォルトでは継承しない。

※説明はまた今度。

*/

class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}



let vehicle = Vehicle()
println("Vehicle: \(vehicle.description)")
// Vehicle: 0 wheel(s)


class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}



let bicycle = Bicycle()
println("Bicycle: \(bicycle.description)")
// Bicycle: 2 wheel(s)




/*
@comment    ### Automatic Initializer Inheritance

※継承、指定initializer, コンビニエンスinitializerこの３つの関係の説明は、重要なので、また
改めて。

*/



/*
@comment    ### Designated and Convenience Initializers in Action

*/



class Food {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}



let namedMeat = Food(name: "Bacon")
// namedMeat's name is "Bacon"



let mysteryMeat = Food()
// mysteryMeat's name is "[Unnamed]"



class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}



let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)




class ShoppingListItem2: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}



var breakfastList = [
    ShoppingListItem2(),
    ShoppingListItem2(name: "Bacon"),
    ShoppingListItem2(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    println(item.description)
}
// 1 x Orange juice ✔
// 1 x Bacon ✘
// 6 x Eggs ✘


/*
@comment
#######################################################
## Failable Initializers

初期化に失敗したときに、nilを返す、Failabel initializer

*/

struct Animal {
    let species: String

    /*
    @comment initの次に「?」を付与すれば、Failable initializerを実装できる。
    */
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}



let someCreature = Animal(species: "Giraffe")
// someCreature is of type Animal?, not Animal

if let giraffe = someCreature {
    println("An animal was initialized with a species of \(giraffe.species)")
}
// prints "An animal was initialized with a species of Giraffe"



let anonymousCreature = Animal(species: "")
// anonymousCreature is of type Animal?, not Animal

if anonymousCreature == nil {
    println("The anonymous creature could not be initialized")
}
// prints "The anonymous creature could not be initialized"



/*
@comment    ### Failable Initializers for Enumerations
*/

enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}



let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
    println("This is a defined temperature unit, so initialization succeeded.")
}
// prints "This is a defined temperature unit, so initialization succeeded."

let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
    println("This is not a defined temperature unit, so initialization failed.")
}
// prints "This is not a defined temperature unit, so initialization failed."



/*
@comment    ### Failable Initializers for Enumerations with Raw Values
*/




enum TemperatureUnit3: Character {
    case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
}

let fahrenheitUnit3 = TemperatureUnit3(rawValue: "F")
if fahrenheitUnit3 != nil {
    println("This is a defined temperature unit, so initialization succeeded.")
}
// prints "This is a defined temperature unit, so initialization succeeded."

let unknownUnit3 = TemperatureUnit3(rawValue: "X")
if unknownUnit3 == nil {
    println("This is not a defined temperature unit, so initialization failed.")
}
// prints "This is not a defined temperature unit, so initialization failed."



/*
@comment    ### Failable Initializers for Classes
*/



class Product {
    let name: String!
    init?(name: String) {
        self.name = name
        if name.isEmpty { return nil }
    }
}



if let bowTie = Product(name: "bow tie") {
    // no need to check if bowTie.name == nil
    println("The product's name is \(bowTie.name)")
}
// prints "The product's name is bow tie"





/*
@comment    ### Propagation of Initialization Failure
*/




class CartItem: Product {
    let quantity: Int!
    init?(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
        if quantity < 1 { return nil }
    }
}



if let twoSocks = CartItem(name: "sock", quantity: 2) {
    println("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}
// prints "Item: sock, quantity: 2"


if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    println("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
    println("Unable to initialize zero shirts")
}
// prints "Unable to initialize zero shirts"




if let oneUnnamed = CartItem(name: "", quantity: 1) {
    println("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
    println("Unable to initialize one unnamed product")
}
// prints "Unable to initialize one unnamed product"



/*
@comment    ### Overriding a Failable Initializer
*/

class Document {
    var name: String?
    // this initializer creates a document with a nil name value
    init() {}
    // this initializer creates a document with a non-empty name value
    init?(name: String) {
        self.name = name
        if name.isEmpty { return nil }
    }
}



class Document0 {
    var name: String?
    // this initializer creates a document with a nil name value
    init() {}
    // this initializer creates a document with a non-empty name value
    init?(name: String) {
        self.name = name
        if name.isEmpty { return nil }
    }
}



class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}



/*
@comment    ### The init! Failable Initializer
*/



/*
@comment
#######################################################
## Required Initializers

必ず実装しなければならないinitializerの前に、requiredというキーワードをかく。

*/



class SomeClass {
    required init() {
        // initializer implementation goes here
    }
}



class SomeSubclass: SomeClass {
    required init() {
        // subclass implementation of the required initializer goes here
    }
}



/*
@comment
#######################################################
## Setting a Default Property Value with a Closure or Function

クロージャ表現をつかって、initializerを実装できる

*/



class SomeClass00 {
    
    let someProperty: Int = {
        // create a default value for someProperty inside this closure
        // someValue must be of the same type as SomeType
        return 256
        }()
}



struct Checkerboard {
    
    /*
    @comment    クロージャ表現で、初期値を実装！
    */
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...10 {
            for j in 1...10 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
        }()

    /*
    @comment
    */
    func squareIsBlackAtRow(row: Int, column: Int) -> Bool {
        return boardColors[(row * 10) + column]
    }
}



let board = Checkerboard()
println(board.squareIsBlackAtRow(0, column: 1))
// prints "true"
println(board.squareIsBlackAtRow(9, column: 9))
// prints "false"


