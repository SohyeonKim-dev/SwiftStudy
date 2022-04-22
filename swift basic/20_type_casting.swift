import Swift

/*
 
 1. 타입캐스팅

 스위프트의 타입캐스팅은 인스턴스의 타입을 확인 하는 용도
 or 클래스의 인스턴스를 부모 혹은 자식 클래스의 타입으로 사용할 수 있는지 확인 하는 용도
-> is, as를 사용합니다.
 
 - 우리가 일반적으로 사용하는 double (int_num) -> 이런 애들과는 다른 의미!
 : 얘는 새로운 객체를 걍 double 형태로 새로 찍어내서 대입하는 개념
 - 상속에서 주로 많이 활용되는 개념!

*/

 class Person {
     var name: String = ""
     func breath() {
         print("숨을 쉽니다")
     }
 }

 class Student: Person {
     var school: String = ""
     func goToSchool() {
         print("등교를 합니다")
     }
 }

 class UniversityStudent: Student {
     var major: String = ""
     func goToMT() {
         print("멤버쉽 트레이닝을 갑니다 신남!")
     }
 }

 // 인스턴스 생성
 var yagom: Person = Person()
 var hana: Student = Student()
 var jason: UniversityStudent = UniversityStudent()


//타입 확인 : is를 사용하여 타입을 확인합니다.

 var result: Bool

 result = yagom is Person // true
 result = yagom is Student // false
 result = yagom is UniversityStudent // false

 result = hana is Person // true
 result = hana is Student // true
 result = hana is UniversityStudent // false

 result = jason is Person // true
 result = jason is Student // true
 result = jason is UniversityStudent // true
// != 다중 상속과는 다른 의미!

 if yagom is UniversityStudent {
     print("yagom은 대학생입니다")
 } else if yagom is Student {
     print("yagom은 학생입니다")
 } else if yagom is Person {
     print("yagom은 사람입니다")
 } // yagom은 사람입니다
// yagom은 대학생은 아니고, 학생도 아니고, 사람! ( 가장 윗세대, 부모 객체! )
// 상속 이후의 일들에 대한 정보가 없다. 가장 편협한 객체! (문법 구조적 범위는 가장 넓지만, 내용적 개념으로는 가장 좁음)


 switch jason {
 case is Person:
     print("jason은 사람입니다")
 case is Student:
     print("jason은 학생입니다")
 case is UniversityStudent:
     print("jason은 대학생입니다")
 default:
     print("jason은 사람도, 학생도, 대학생도 아닙니다")
 } // jason은 사람입니다

 switch jason {
 case is UniversityStudent:
     print("jason은 대학생입니다")
 case is Student:
     print("jason은 학생입니다")
 case is Person:
     print("jason은 사람입니다")
 default:
     print("jason은 사람도, 학생도, 대학생도 아닙니다")
 } // jason은 대학생입니다

// jason은 사람이자, 학생이자, 대학생이라서,
// 먼저 충족하는 조건을 갖고 switch 구문을 탈출하기 때문!





/*
 
업 캐스팅

 as를 사용하여 부모 클래스의 인스턴스로 사용할 수 있도록 컴파일러에게 타입 정보를 전환해줍니다.
 Any 혹은 AnyObject로도 타입정보를 변환할 수 있습니다.
 암시적으로 처리되므로 꼭 필요한 경우가 아니라면 생략해도 무방합니다.

 */

 // UniversityStudent 인스턴스를 생성하여 Person 행세를 할 수 있도록 업 캐스팅
 var mike: Person = UniversityStudent() as Person

 var jenny: Student = Student()
 //var jina: UniversityStudent = Person() as UniversityStudent // 컴파일 오류

 // UniversityStudent 인스턴스를 생성하여 Any 행세를 할 수 있도록 업 캐스팅
 var jina: Any = Person() // as Any 생략가능


/*
 
 조건부 다운 캐스팅

 as?를 사용합니다.
 캐스팅에 실패하면, 즉 캐스팅하려는 타입에 부합하지 않는 인스턴스라면 nil을 반환
 -> 따라서 결과의 타입은 옵셔널 타입입니다.
 // 아니 이거 아무것도 안되는 것 같은데 왜 씀?
 // 아니지.. mike 처럼 한번 업캐스팅 한 애들은, 다시 원상복귀로 가능하지
 
 */

 var optionalCasted: Student?

 optionalCasted = mike as? UniversityStudent
 optionalCasted = jenny as? UniversityStudent // nil
 optionalCasted = jina as? UniversityStudent // nil
 optionalCasted = jina as? Student // nil




/*
 
 강제 다운 캐스팅

 as!를 사용합니다.
 캐스팅에 실패하면, 즉 캐스팅하려는 타입에 부합하지 않는 인스턴스라면 런타임 오류가 발생합니다.
 (강제적으로 오류를 발생시킨다.)
 캐스팅에 성공하면 옵셔널이 아닌 일반 타입을 반환합니다.
 : 결과 값이 옵셔널이 아니라는 장점이 있음.
 
*/

 var forcedCasted: Student

 optionalCasted = mike as! UniversityStudent
 //optionalCasted = jenny as! UniversityStudent // 런타임 오류
 //optionalCasted = jina as! UniversityStudent // 런타임 오류
 //optionalCasted = jina as! Student // 런타임 오류





 func doSomethingWithSwitch(someone: Person) {
     switch someone {
     case is UniversityStudent:
         (someone as! UniversityStudent).goToMT()
     case is Student:
         (someone as! Student).goToSchool()
     case is Person:
         (someone as! Person).breath()
     }
 }

 doSomethingWithSwitch(someone: mike as Person) // 멤버쉽 트레이닝을 갑니다 신남!
 doSomethingWithSwitch(someone: mike) // 멤버쉽 트레이닝을 갑니다 신남!
 doSomethingWithSwitch(someone: jenny) // 등교를 합니다
 doSomethingWithSwitch(someone: yagom) // 숨을 쉽니다


 func doSomething(someone: Person) {
     if let universityStudent = someone as? UniversityStudent {
         universityStudent.goToMT()
     } else if let student = someone as? Student {
         student.goToSchool()
     } else if let person = someone as? Person {
         person.breath()
     }
 }

 doSomething(someone: mike as Person) // 멤버쉽 트레이닝을 갑니다 신남!
 doSomething(someone: mike) // 멤버쉽 트레이닝을 갑니다 신남!
 doSomething(someone: jenny) // 등교를 합니다
 doSomething(someone: yagom) // 숨을 쉽니다
