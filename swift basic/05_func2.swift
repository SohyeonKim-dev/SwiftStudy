import Swift

// more useful concept of func

//1. 매개변수 기본 값

func greeting(friend: String, me: String = "yagom") {
    print("Hello \(friend)! I'm \(me)")
}

greeting(friend: "hana") // Hello hana! I'm yagom
greeting(friend: "john", me: "eric") // Hello john! I'm eric



//2. 전달 인자 레이블 (to, from ... etc : overloading ok)

func greeting(to friend: String, from me: String) {
    print("Hello \(friend)! I'm \(me)")
}

// 함수를 호출할 때에는 전달인자 레이블을 사용해야 합니다
greeting(to: "hana", from: "yagom") // Hello hana! I'm yagom



//3. 가변 매개변수

func sayHelloToFriends(me: String, friends: String...) -> String {
    return "Hello \(friends)! I'm \(me)!"
}

print(sayHelloToFriends(me: "yagom", friends: "hana", "eric", "wing"))
print(sayHelloToFriends(me: "yagom"))



//4. func as datatype : functional programming
// : 함수명, 매개변수, 반환 타입을 명시해주면 함수도 data type, 객체처럼 사용 가능

var someFunction: (String, String) -> Void = greeting(to:from:)
someFunction("eric", "yagom")

someFunction = greeting(friend:me:)
someFunction("eric", "yagom")




func runAnother(function: (String, String) -> Void) {
    function("jenny", "mike")
}

runAnother(function: greeting(friend:me:))
runAnother(function: someFunction)
