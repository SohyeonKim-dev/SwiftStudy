import Swift

// struct : 구조체
// member -> property (diff)
// func -> method (same)





struct Sample {
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
    static func typeMethod() {
        print("type method")
    }
}







var mutable: Sample = Sample()
// sample type의 객체 mutable을 선언, sample 객체 생성하여 대입
mutable.mutableProperty = 200
// 해당 객체의 인스턴스를 수정 (var) 라서 가능
//mutable.immutableProperty = 200 (error)


// 불변 인스턴스
let immutable: Sample = Sample()

// 불변 인스턴스는 아무리 가변 프로퍼티라도 인스턴스 생성 후에 수정x !
//immutable.mutableProperty = 200
//immutable.immutableProperty = 200


// * 타입 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod()
// -> 모든 Sample type 객체들이 공유하는건가?
// 이건 언제 사용하려고 만든 개념이지?

// 인스턴스에서는 타입 프로퍼티나 타입 메서드를 사용 X !
//mutable.typeProperty = 400
//mutable.typeMethod()





// ex)

struct Student {
    var name: String = "unknown"

    // 키워드도 `로 묶어주면 이름으로 사용 가능 (..?)
    var `class`: String = "Swift"
    
    // 타입 메서드 (학생 객체 모두 공통의 기능)
    static func selfIntroduce() {
        print("학생타입입니다")
    }
    
    // 인스턴스 메서드
    // self는 인스턴스 자신을 지칭하며, 몇몇 경우를 제외하고 사용은 선택사항입니다 (python)
    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다")
    }
}

// 타입 메서드 사용
Student.selfIntroduce()

// 가변 인스턴스 생성
var yagom: Student = Student()
yagom.name = "yagom"
yagom.class = "스위프트"
yagom.selfIntroduce()   // 저는 스위프트반 yagom입니다

// 불변 인스턴스 생성 (let)은 멤버 수정 X!
