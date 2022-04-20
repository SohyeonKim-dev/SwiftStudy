import Swift

/*
 
 class vs struct, enum
 : class 는 참조 형식, 구조체와 열거형은 값 형식
 - apple framework == class (ref)
 - swift framework == struct (value)
 : swift는 구조체 사용을 좋아하지만, 애플은 class 사용 (선택은 우리의 몫!)
 
 구조체는 언제 사용?
 - data type으로 표현하고 싶을 때
 - 참조가 아닌 단순한 값의 복사를 원할 때
 - 상속이 필요하지 않을 때
 
 - value : 값을 전달할 때, data를 복사하여 전달
 - reference : 값을 전달할 때, 메모리 위치를 전달
 
 */


struct ValueType {
    var property = 1
}

class ReferenceType {
    var property = 1
}



// 구조체 : 값의 단순 복사 (불변)

let firstStructInstance = ValueType()
// 두 번째 구조체 인스턴스에 첫 번째 인스턴스 값 복사
var secondStructInstance = firstStructInstance
secondStructInstance.property = 2

// 첫 번째 구조체 인스턴스의 프로퍼티 값에는 영향이 없음
print(firstStructInstance)
print(secondStructInstance)


// 클래스 : 참조형 복사, 메모리 주소 복사 (가변)

let firstClassReference = ReferenceType()
let secondClassReference = firstClassReference
secondClassReference.property = 2
// let 이더라도, var member는 수정 가능!

// 두 번째 클래스 참조는 첫 번째 클래스 인스턴스를 참조 -> 첫 번째 클래스 인스턴스의 프로퍼티도 변경하게 됨
print(firstClassReference.property)
print(secondClassReference.property)
