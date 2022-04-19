import Swift


// 1. for - in

var integers = [1, 2, 3]
let people = ["yagom": 10, "eric": 15, "mike": 12]

for integer in integers {
    print(integer)
}

// Dictionary's item is tuple of key and value
// -> 그래서 ( 변수, 변수 ) 이런 형식으로 사용하는구나

for (name, age) in people {
    print("\(name): \(age)")
}



// 2. while

while integers.count > 1 {
    integers.removeLast()
}



// 3. repeat - while
// ~= do - while

repeat {
    integers.removeLast()
} while integers.count > 0

