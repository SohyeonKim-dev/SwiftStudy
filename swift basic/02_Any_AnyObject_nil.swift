import Swift

// 기본 data type
// Bool, Int, UInt, Float, Double, Character, String
// type 사이의 변환에 엄격한 편

/*
 Any : 모든 타입을 지정하는 키워드
 AnyObject : 모든 클래스 타입을 지칭하는 프로토콜
 nil : 없음을 의미하는 키워드
 */

var someAny : Any = 100
someAny = 20.3
// 어떤 타입도 수용 가능

//

class SomeClass {}
var someAnyObject : AnyObject = SomeClass()
// someAnyObject = 123.5

// someAny = nil
// someAnyObject = nil

