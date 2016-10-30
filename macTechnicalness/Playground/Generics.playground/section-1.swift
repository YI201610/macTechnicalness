// Playground - noun: a place where people can play

import Cocoa

/*!
 * @abstract    Generics機能の実装例
 */
func repeat<Hoge>(item: Hoge, times: Int) -> [Hoge]
{
    var result = [Hoge]()

    for i in 0..<times {
        result.append(item)
    }
    
    return result
}

let a1 = repeat("knock", 4)

let a2 = repeat(3.14, 50)

print(a1)
print(a2)
