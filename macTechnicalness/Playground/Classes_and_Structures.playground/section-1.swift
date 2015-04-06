/*!
@abstract   構造体は値型であり、クラスは参照型である。
*/

/*!
@abstract   矩形構造体
*/
struct Rect {
    var x: Float = 0
    var y: Float = 0
    var width: Float = 0
    var height: Float = 0
}

var aRect = Rect()
var bRect = Rect(x: 0, y: 0, width: 128, height: 256)

aRect.width = 55

var copiedRect = bRect
copiedRect.width = 133

/*
@comment    構造体は値型なので、aRectがcopiedRect操作の影響を受けることがない
*/
aRect.width
copiedRect.width




/*!
@abstract   クラスで表現する矩形
*/
class RectClass {
    var x: Float = 0
    var y: Float = 0
    var width: Float = 0
    var height: Float = 0
    
    func maxX() -> Float {
        return x + width
    }
}

var cRect = RectClass()
var copiedRect3 = cRect

cRect.width = 128
cRect.height = 256

copiedRect3.width = 5
copiedRect3.height = 12

var width3 = copiedRect3.width
var height3 = copiedRect3.height

/*
@comment    クラスは参照型なので、copiedRect3を操作すると、cRectにも影響が及んでしまう
*/
cRect.width
cRect.height

