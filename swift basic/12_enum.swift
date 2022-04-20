import Swift



// enum type : 열거형 정의

enum Weekday {
    case mon
    case tue
    case wed
    case thu, fri, sat, sun
}

var day: Weekday = Weekday.mon
var day2 = Weekday.tue // 간략한 표현도 사용 가능
day = .tue
day2 = .wed

print(day)
print(day2)






// switch의 비교값에 열거형 : 모든 열거형 포함 -> default 없어도 됨

switch day {
case .mon, .tue, .wed, .thu:
    print("평일입니다")
case Weekday.fri:
    print("불금 파티!!")
case .sat, .sun:
    print("신나는 주말!!")
}
// error 발생 없음






// 원시값 설정 ( : INT )
// 원시값이 중복되어서는 안된다. ex) case mango = 0 -> error

enum Fruit: Int {
    case apple = 0
    case grape = 1
    case peach
}

print(Fruit.peach.rawValue)
// 정수면 자동으로 1씩 증가하여, 복숭아에 2가 대입된 것을 알 수 있다.




enum School: String {
    case elementary = "초등"
    case middle = "중등"
    case high = "고등"
    case university
}

print(School.middle.rawValue)
print(School.university.rawValue)
// 얘는 그냥 case 이름 (university)로 저장


// rawValue를 통해 초기화 한 열거형 값 == 옵셔널 타입 != Fruit 타입
//let apple: Fruit = Fruit(rawValue: 0)
// 그냥 type에다가 Fruit 으로 적으면 오류가 발생하는구나..?
// 왜냐하면 rawValue 까지 있어야 하니깐, nil 일 수도 있어서 보호!
// optional 값이라는 것이 구체적으로 무슨 의미?

let apple: Fruit? = Fruit(rawValue: 3)
print(Fruit.apple.rawValue)
print(apple.customMirror.subjectType)


// if let 구문 사용 -> rawValue에 해당하는 케이스를 곧바로 사용 가능
if let orange: Fruit = Fruit(rawValue: 5) {
    print("rawValue 5에 해당하는 케이스는 \(orange)입니다")
} else {
    print("rawValue 5에 해당하는 케이스가 없습니다")
} // rawValue 5에 해당하는 케이스가 없습니다


// 아! 이런 방식으로 optional 사용하는거구만! (조건문으로 한단계 걸러서! )
// 그러니깐, 다른 언어들처럼 raw Value가 예상되는 값이랑 다를 때, 암묵적으로 혹은
// 자동적으로 수행되는 과정을, swift는 사용자 명시적으로 보여주기 위해서 optional이라는 개념을 쓰네! 





// 열거행 내부에 메소드도 구현할 수 있음!
// 마치 class 객체의 내부 메소드 사용하듯이 . 으로 활용하면 된다. :)

enum Month {
    case dec, jan, feb
    case mar, apr, may
    case jun, jul, aug
    case sep, oct, nov
    
    func printMessage() {
        switch self {
        case .mar, .apr, .may:
            print("따스한 봄~")
        case .jun, .jul, .aug:
            print("여름 더워요~")
        case .sep, .oct, .nov:
            print("가을은 독서의 계절!")
        case .dec, .jan, .feb:
            print("추운 겨울입니다")
        }
    }
}

Month.mar.printMessage()
// 따스한 봄~


