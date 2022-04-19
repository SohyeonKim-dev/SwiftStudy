import Swift

// optional -> 값을 보호해주는 보호막이 있다!
// ? or ! : enum 열거형 타입으로 박스가 감싸고 있다.
// optional unwrapping ; 옵셔널 값 추출




// 1) Optional Binding
// : 정중하게 노크하고 값을 가져오는 과정


func printName(_ name: String) {
    print(name)
}

var myName: String? = nil

//printName(myName)
// 전달되는 값의 타입이 다르기 때문에 컴파일 오류발생

if let name: String = myName {
    printName(name)
} else {
    print("myName == nil")
}


var yourName: String! = nil

if let name: String = yourName {
    printName(name)
} else {
    print("yourName == nil")
}

// name 상수는 if-let 구문 내에서만 사용가능합니다
// 상수 사용범위를 벗어났기 때문에 컴파일 오류 발생
// + let func's return == bool 이어야 사용 가능한거 아님?


// 여러 개의 값을 바인딩 가능 (모든 옵셔널에 값이 있을 때만)

myName = "yagom"
yourName = nil

if let name = myName, let friend = yourName {
    print("\(name) and \(friend)")
}
// yourName이 nil이기 때문에 실행되지 않습니다


yourName = "hana"

if let name = myName, let friend = yourName {
    print("\(name) and \(friend)")
}






// 2) Force Unwrapping
// : 강제 추출 ( 박스를 깨부숨 )


printName(myName!)
myName = nil

//print(myName!)
// 강제추출시 값이 없으므로 런타임 오류 발생
yourName = nil

//printName(yourName)
// nil 값이 전달되기 때문에 런타임 오류발생
// 과격한 방법으로, 추천하지 않는다.
