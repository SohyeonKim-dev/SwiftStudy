import Swift

// class : 구조체는 값 타입, 클래스는 ref(참조) 타입
// class는 불변 객체(인스턴스)더라도, 참조 유형이므로 가변 프로퍼티가 변경 가능함!
// : 불변 프로퍼티는 변경 불가능, 그리고 객체 자체는 변경 불가능함. 단지 객체 내부의 가변 멤버만 변경 가능




class Sample {
    // 가변 프로퍼티
    var mutableProperty: Int = 100

    // 불변 프로퍼티
    let immutableProperty: Int = 100
    
    // 타입 프로퍼티
    static var typeProperty: Int = 100
    
    // 인스턴스 메서드
    func instanceMethod() {
        print("instance method")
    }
    
    // 타입 메서드
    // 재정의 불가 타입 메서드 - static
    static func typeMethod() {
        print("type method - static")
    }
    
    // 재정의 가능 타입 메서드 - class
    class func classMethod() {
        print("type method - class")
    }
}





// 인스턴스 생성 - 참조정보 수정 가능
var mutableReference: Sample = Sample()

mutableReference.mutableProperty = 200
// 불변 프로퍼티는 인스턴스 생성 후 수정 X
//mutableReference.immutableProperty = 200


// 인스턴스 생성 - 참조정보 수정 불가
let immutableReference: Sample = Sample()

// 클래스의 인스턴스는 참조 타입이므로 let으로 선언되었더라도 인스턴스 프로퍼티의 값 변경이 가능합니다
immutableReference.mutableProperty = 200

// 다만 참조정보를 변경할 수는 없음
//immutableReference = mutableReference

// 참조 타입이라도 불변 인스턴스는 수정 불가능
//immutableReference.immutableProperty = 200


// 타입 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod() // type method

// 인스턴스에서는 타입 프로퍼티나 타입 메서드 사용 불가
//mutableReference.typeProperty = 400
//mutableReference.typeMethod()







class Student {
    // 가변 프로퍼티
    var name: String = "unknown"

    // 키워드도 `로 묶어주면 이름으로 사용할 수 있습니다 ( -> 뭔소린지 모르겠음 )
    var `class`: String = "Swift"
    
    // 타입 메서드
    class func selfIntroduce() {
        print("학생타입입니다")
    }
    
    // 인스턴스 메서드 (이게 오버로딩이 되네..?)
    // self는 인스턴스 자신을 지칭하며, 몇몇 경우를 제외하고 사용은 선택사항입니다
    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다")
    }
}

// 타입 메서드 사용
// student 실객체 생성 전에도 사용가능! 신기하구만 얘는 어디에 소속된 녀석인고!
Student.selfIntroduce() // 학생타입입니다

// 인스턴스 생성
var yagom: Student = Student()
yagom.name = "yagom"
yagom.class = "스위프트"
yagom.selfIntroduce()   // 저는 스위프트반 yagom입니다 // != 타입 메소드 == 인스턴스 메소드

// 인스턴스 생성
let jina: Student = Student()
jina.name = "jina"
jina.class = "korea"
// (불면 인스턴스에서도 가변 프로퍼티 변경 가능! )
jina.selfIntroduce() // 저는 Swift반 jina입니다
