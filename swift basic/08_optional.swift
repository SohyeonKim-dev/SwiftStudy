import Swift



// optional : 값이 있을 수도 있고, 없을 수도 있음
// why using optional? -> nil 의 가능성을 문서화하지 않고, 코드만으로 충분히 표현 가능
// ex) 해당 값은 NULL (nil)이 아니어야 한다 같은 주석이 필요 없다.

 // optional = enum + general





// 1) ! : 암시적 추출 optional

var implicitlyUnwrappedOptionalValue: Int! = 100

switch implicitlyUnwrappedOptionalValue {
case .none:
    print("This Optional variable is nil")
case .some(let value):
    print("Value is \(value)")
}

// 기존 변수처럼 사용 가능
implicitlyUnwrappedOptionalValue = implicitlyUnwrappedOptionalValue + 1

// nil 할당 가능
implicitlyUnwrappedOptionalValue = nil

// 잘못된 접근으로 인한 런타임 오류 발생
//implicitlyUnwrappedOptionalValue = implicitlyUnwrappedOptionalValue + 1




// 2) ? : optional

var optionalValue: Int? = 100

switch optionalValue {
case .none:
    print("This Optional variable is nil")
case .some(let value):
    print("Value is \(value)")
}



// nil 할당 가능
optionalValue = nil

// 기존 변수처럼 사용불가 - 옵셔널과 일반 값(int)은 다른 타입이므로 연산 X
//optionalValue = optionalValue + 1



// 아직까지는 정확하게 이해 X
// 어떻게 사용하는 건지는 코드 상에서 익히는게 맞을 것 같다. 
