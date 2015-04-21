/*!
* @abstract 例１
*/
func sayHello(personName: String) -> String {
    let greeting = "Hello, " + personName + "!"
    return greeting
}

println(sayHello("テスト"))
println(sayHello("iOS"))

