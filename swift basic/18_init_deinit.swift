import Swift

/*


 1. 프로퍼티 기본값

 스위프트의 모든 인스턴스는 초기화와 동시에 모든 프로퍼티에 유효한 값이 할당되어 있어야 합니다.
 프로퍼티에 미리 기본값을 할당해두면 인스턴스가 생성됨과 동시에 초기값을 지니게 됩니다.
 
 */

 class PersonA {
     // 모든 저장 프로퍼티에 기본값 할당
     var name: String = "unknown"
     var age: Int = 0
     var nickName: String = "nick"
 }

 // 인스턴스 생성
 let jason: PersonA = PersonA()
// 단순하게 괄호 하나만으로 온전한 객체를 생성할 수 있음


// 이후 수정 가능
 jason.name = "jason"
 jason.age = 30
 jason.nickName = "j"




 // 프로퍼티 기본값을 지정하기 어려운 경우에는 이니셜라이저 init을 통해 인스턴스가 가져야 할 초기값을 전달
 // init 으로 class 내부에서 처리하면, 선언과 동시에 값을 할당하지 않아도 된다.

 class PersonB {
     var name: String
     var age: Int
     var nickName: String
     
     // 이니셜라이저
     init(name: String, age: Int, nickName: String) {
         self.name = name
         self.age = age
         self.nickName = nickName
     }
 }

 let hana: PersonB = PersonB(name: "hana", age: 20, nickName: "하나")




// 프로퍼티의 초기값이 꼭 필요 없을 때 옵셔널을 사용!
// 즉 닉네임은 있어도 되고, 없어도 되는 (nil) 값
// 생성자 오버로딩을 활용한다.

 class PersonC {
     var name: String
     var age: Int
     var nickName: String?
     
     init(name: String, age: Int, nickName: String) {
         self.name = name
         self.age = age
         self.nickName = nickName
     }
     
     init(name: String, age: Int) {
         self.name = name
         self.age = age
     }
     
     // 여기서 자신의 생성자를 사용할 수 있음
     // 간략한 형태의 두번째 생성자를 self.init 형태로, 첫번째 생성자에서 사용 가능
     // 근데 자기 자신 생성자 쓰려면 간략화 생성자 (convenience init) 이라고 적어줘야 함
     
     
//     convenience init(name: String, age: Int, nickName: String) {
//         self.init(name: <#T##String#>, age: <#T##Int#>)
//         self.nickName = nickName
//     }
 }

 let jenny: PersonC = PersonC(name: "jenny", age: 10)
 let mike: PersonC = PersonC(name: "mike", age: 15, nickName: "m")




// 암시적 추출 옵셔널은 인스턴스 사용에 꼭 필요하지만 초기값을 할당하지 않고자 할 때 사용
// 지금은 값을 넣지 않지만, 얘는 꼭 값이 들어가야 할 때 -> ! 옵셔널

class Puppy {
     var name: String
     var owner: PersonC!
     
     init(name: String) {
         self.name = name
     }
     
     func goOut() {
         print("\(name)가 주인 \(owner.name)와 산책을 합니다")
     }
 }

 let happy: Puppy = Puppy(name: "happy")
 //happy.goOut() : 주인이 없는 상태라 오류 발생

 happy.owner = jenny
 happy.goOut()





// 실패가능한 이니셜라이저

/*

 이니셜라이저 매개변수로 전달되는 초기값이 잘못된 경우 인스턴스 생성에 실패할 수 있습니다.
 인스턴스 생성에 실패하면 nil을 반환합니다.
 그래서 실패가능한 이니셜라이저의 반환타입은 옵셔널 타입입니다.
 -> init?을 사용합니다.
 
 */

 class PersonD {
     var name: String
     var age: Int
     var nickName: String?
     
     init?(name: String, age: Int) {
         if (0...120).contains(age) == false {
             return nil
         }
         
         if name.count == 0 {
             return nil
         }
         
         self.name = name
         self.age = age
     }
 }

 //let john: PersonD = PersonD(name: "john", age: 23)
// optional type이라서 ? 없이 그냥 사용하면 오류 발생함

 let john: PersonD? = PersonD(name: "john", age: 23)
 let joker: PersonD? = PersonD(name: "joker", age: 123)
 let batman: PersonD? = PersonD(name: "", age: 10)

 print(joker) // nil
 print(batman) // nil
// 이름이 없을 수도 있다의 예시! -> optional 의 필요성 !




/*
 
 디이니셜라이저

 deinit은 클래스의 인스턴스가 메모리에서 해제되는 시점에 호출됩니다.
 인스턴스가 해제되는 시점에 해야할 일을 구현할 수 있습니다.
 자동으로 호출되므로 직접 호출할 수 없습니다. ( main 함수가 끝날 때 )
 디이니셜라이저는 클래스 타입에만 구현할 수 있습니다.
 
 */

 class PersonE {
     var name: String
     var pet: Puppy?
     // pet이 있을 수도 있고, 없을 수도 있어서 optional
     var child: PersonC
     
     init(name: String, child: PersonC) {
         self.name = name
         self.child = child
     }
     
     // 인스턴스가 메모리에서 해제되는 시점에 자동 호출
     deinit {
         if let petName = pet?.name {
             // pet? -> optional을 붙인 것을 자연스럽게 객체로 활용!
             print("\(name)가 \(child.name)에게 \(petName)를 인도합니다")
             self.pet?.owner = child
         }
     }
 }

 var donald: PersonE? = PersonE(name: "donald", child: jenny)
 donald?.pet = happy
 donald = nil
// donald 인스턴스가 더이상 필요 없으므로 메모리에서 해제
 // donald가 jenny에게 happy를 인도합니다 -> 미리 작성된 소멸자 문구
 
