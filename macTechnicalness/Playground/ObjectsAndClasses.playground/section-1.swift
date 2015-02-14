// Playground - noun: a place where people can play

import Cocoa

/*!
@abstract 形クラス
*/
class Shape {
    //属性
    var numberOfSides = 0   //辺の数
    let hogeString = "this is sample property"  //挨拶
    
    //動作
    func sampleAction() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

//クラスを
var shape = Shape()
shape.numberOfSides = 256
var shapeDesc = shape.sampleAction()


/*!
@abstract   何かの基底クラス
*/
class NamedShape {
    
    //プロパティは宣言時かinitで初期化すること
    var numberOfSides: Int = 0      //辺の数
    var name: String
    
    //initで初期化する。nameに初期値を与えてない状態で、initの実装を外すことはできない。
    init(name: String) {
        self.name = name
    }
    
    //deinit
    
    //
    func hogeAction() -> String {
        return "{\(name)}A shape with \(numberOfSides) sides."
    }
}

//initを使って、NamedShapeクラスを生成する。
var namedShape = NamedShape(name: "hoge")


/*!
@abstract   NamedShapeクラスから派生した、Squareクラス。
*/
class Square : NamedShape {
    var sideLength: Double
    
    /*!
    @abstract
    */
    init(sideLengthValue: Double, nameString: String){
        
        //自身のプロパティに値を代入する。
        self.sideLength = sideLengthValue
        
        //自身の親クラスのinitを実行する。
        super.init(name: nameString)
        
        //親から受け継いだプロパティに値を代入する。
        numberOfSides = 4
    }
    
    /*!
    @abstract   面積を返す。
    */
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func hogeAction() -> String {
        let a = "{\(name) square side length: \(sideLength)"
        println(a)
        return a
    }
}

//testObjという固定オブジェクトを生成する。
let testObj = Square(sideLengthValue: 3.14, nameString: "HogeSquare")

//testObjの各種メソッドを実行する。
testObj.area()
testObj.hogeAction()


/*!
@abstract   正三角形。NamedShapeを継承するもの。
*/
class EquilateralTriangle : NamedShape {
    var sideLength: Double = 0
    
    /*!
    @abstract
    */
    init(sideLengthValue: Double, nameString: String) {
        self.sideLength = sideLengthValue
        super.init(name: nameString)
        numberOfSides = 3
    }
    
    /*!
    @abstract   perimeter: 周囲の長さ
    プロパティはゲッターとセッターを持てる
    */
    var perimeter: Double {
        get {
            return sideLength * 3
        }
        set {
            sideLength = newValue / 3   //'newValue'というキーワードを使用することができる。
        }
    }
    
    override func hogeAction() -> String {
        var tmp: String = "{\(name) Equilateral Triangle with sides of length: \(sideLength)}"
        println(tmp)
        return tmp
    }
}

var equilateralTriangle = EquilateralTriangle(sideLengthValue: 9, nameString: "正三角形")
equilateralTriangle.hogeAction()
equilateralTriangle.perimeter
equilateralTriangle.perimeter = 10
equilateralTriangle.perimeter
equilateralTriangle.sideLength

/*!
@abstract 三角形と矩形を要素に持つ謎の存在
*/
class TriangleAndSquare {
    
    var triangle : EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square : Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
        
    }
    
    init(size: Double, name: String){
        triangle = EquilateralTriangle(sideLengthValue: size, nameString: name)
        square = Square(sideLengthValue: size, nameString: name)
    }
    
}
