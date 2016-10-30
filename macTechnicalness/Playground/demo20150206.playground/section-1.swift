/*!
* @abstract 例１
*/
func sayHello(personName: String) -> String {
    let greeting = "Hello, " + personName + "!"
    return greeting
}

print(sayHello("テスト"))
print(sayHello("iOS"))

