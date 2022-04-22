import Swift

/* 상속!
 
 스위프트의 상속은 클래스, 프로토콜 등에서 가능합니다. 열거형, 구조체는 상속이 불가능합니다.
 스위프트는 다중 상속을 지원하지 않습니다. (오!)
 이번 파트에서는 클래스의 상속에 대해서 알아봅니다

 */


 // 기반 클래스 Person (부모 클래스)

 class Person {
     var name: String = ""
     
     func selfIntroduce() {
         print("저는 \(name)입니다")
     }
     
     // 인스턴스 메소드 ( 일반 함수 )
     // final 키워드를 사용하여 재정의를 방지할 수 있습니다
     // 오버라이딩 (자식이 재정의) 방지
     final func sayHello() {
         print("hello")
     }
     
     
     // 타입 메서드 (앞에 static or class 붙음 -> 둘 차이가 여기서 나오네! )
     // 재정의 불가 타입 메서드 - static
     static func typeMethod() {
         print("type method - static")
     }
     
     // 재정의 가능 타입 메서드 - class ( overriding 가능 )
     class func classMethod() {
         print("type method - class")
     }
     
     // 재정의 가능한 class 메서드라도 final 키워드를 사용하면 재정의 할 수 없습니다
     // 메서드 앞의 `static`과 `final class`는 똑같은 역할을 합니다 -> 굳이 길게 써야하나?
     final class func finalCalssMethod() {
         print("type method - final class")
     }
 }


 // Person을 상속받는 Student
 class Student: Person {
     var major: String = ""
     
     override func selfIntroduce() {
         print("저는 \(name)이고, 전공은 \(major)입니다")
     }
     
     override class func classMethod() {
         print("overriden type method - class")
     }
     
     // static을 사용한 타입 메서드는 재정의 할 수 없습니다
 //    override static func typeMethod() {    }
     
     // final 키워드를 사용한 메서드, 프로퍼티는 재정의 할 수 없습니다
 //    override func sayHello() {    }
 //    override class func finalClassMethod() {    }

 }


// 동작 확인

 let yagom: Person = Person()
 let hana: Student = Student()

 yagom.name = "yagom"
 hana.name = "hana"
 hana.major = "Swift"

 yagom.selfIntroduce()
 // 저는 yagom입니다

 hana.selfIntroduce()
 // 저는 hana이고, 전공은 Swift입니다

 Person.classMethod()
 // type method - class

 Person.typeMethod()
 // type method - static

 Person.finalCalssMethod()
 // type method - final class


 Student.classMethod()
 // overriden type method - class

 Student.typeMethod()
 // type method - static

 Student.finalCalssMethod()
 // type method - final class

