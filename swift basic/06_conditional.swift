import Swift


// 1. if - else
 
let someInteger = 100

if someInteger < 100 {
    print("100 미만")
} else if someInteger > 100 {
    print("100 초과")
} else {
    print("100")
} // 100

// + conditional == bool . != int



// 2. switch

switch someInteger {
case 0:
    print("zero")
case 1..<100:
    print("1~99")
case 100:
    print("100")
case 101...Int.max:
    // 범위의 끝을 포함 ( <= )
    print("over 100")
default:
    print("unknown")
} // 항상 default를 꼭 작성해야 한다!



// 정수 외의 대부분의 기본 타입을 사용 가능

switch "yagom" {
case "jake":
    print("jake")
    // 자동으로 break가 걸린다.
    // 예전처럼 사용하려면 fallthrough 활용하면 통과 가능!
case "mina":
    print("mina")
case "yagom":
    print("yagom!!")
default:
    print("unknown")
}

