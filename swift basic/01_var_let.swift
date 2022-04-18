import Swift

// var, let declaration

let age : Int = 22
var name : String = "Colli"
name = "Sohyeon"

print("hello, I am \(age) years old. :)");
print("My name is \(name) !");

class Person {
    var name : String = "Soso"
    var age : Int = 20 + 2
}

let sohyeon = Person()

print(sohyeon)
// __lldb_expr_7.Person

dump(sohyeon)
/*
 - name: "Soso"
 - age: 22
 */
