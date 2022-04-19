import Swift

/*
func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입 ...) -> 반환타입 {
    /* 함수 구현부 */
    return 반환값
}
*/


// sum이라는 이름을 가지고
// a와 b라는 Int 타입의 매개변수를 가지며
// Int 타입의 값을 반환하는 함수
func sum(a: Int, b: Int) -> Int {
    return a + b
}

// void 일 경우, 생략 가능
/*
 
 
 1)
 func printMyName(name: String) -> Void {
     print(name)
 }

 2)
 func printYourName(name: String) {
     print(name)
 }
 
 3)
 func maximumIntegerValue() -> Int {
     return Int.max
 }
 
 4)
 func hello() -> Void { print("hello") }
 
 5)
 func bye() { print("bye") }
 
 
 */


// func call

/*
 ex)
 
 sum(a: 3, b: 5) // 8

 printMyName(name: "yagom") // yagom

 printYourName(name: "hana") // hana

 maximumIntegerValue() // Int의 최댓값

 hello() // hello

 bye() // bye
 
 */
