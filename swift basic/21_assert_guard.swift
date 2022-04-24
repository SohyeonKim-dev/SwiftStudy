import Swift

/*
 
 Assertion

 assert(_:_:file:line:) 함수를 사용합니다.
 assert 함수는 디버깅 모드에서만 동작합니다.
 배포하는 애플리케이션에서는 제외됨 -> 주로 디버깅 중 조건의 검증을 위하여 사용합니다.

*/


 var someInt: Int = 0
 assert(someInt == 0, "someInt != 0")

 someInt = 1
 //assert(someInt == 0) // 동작 중지, 검증 실패
 //assert(someInt == 0, "someInt != 0") // 동작 중지, 검증 실패
 // assertion failed: someInt != 0: file guard_assert.swift, line 26
// -> 앞의 조건을 만족하지 않으면, error를 뱉음



 func functionWithAssert(age: Int?) {
     
     assert(age != nil, "age == nil")
     
     assert((age! >= 0) && (age! <= 130), "나이값 입력이 잘못되었습니다")
     print("당신의 나이는 \(age!)세입니다")
 }

 functionWithAssert(age: 50)
 //functionWithAssert(age: -1) // 동작 중지, 검증 실패
 //functionWithAssert(age: nil) // 동작 중지, 검증 실패






/* 빠른 종료 : Early Exit

 guard를 사용하여 잘못된 값의 전달 시 특정 실행구문을 빠르게 종료합니다.
 디버깅 모드 뿐만 아니라 어떤 조건에서도 동작합니다.
 guard의 else 블럭 내부에는 특정 코드블럭을 종료하는 지시어(return, break 등)가 꼭 있어야 합니다.
 타입 캐스팅, 옵셔널과도 자주 사용됩니다.
 그 외에도 단순 조건 판단 후 빠르게 종료할 때도 용이합니다. -> dict 사전 활용할 때!
 
 */


 func functionWithGuard(age: Int?) {
     
     guard let unwrappedAge = age,
         unwrappedAge < 130,
         unwrappedAge >= 0 else {
         print("나이값 입력이 잘못되었습니다")
         return
     }
     
     print("당신의 나이는 \(unwrappedAge)세입니다")
     // 위의 3가지 조건을 모두 만족하면 (nil) 도 아니고 -> 아래의 문장 시행
 }





 var count = 1

 while true {
     guard count < 3 else {
         break
     }
     print(count)
     count += 1
 }
 // 1
 // 2





 func someFunction(info: [String: Any]) {
     guard let name = info["name"] as? String else {
         return
     }
     
     guard let age = info["age"] as? Int, age >= 0 else {
         return
     }
     
     print("\(name): \(age)")
     
 }


// dict -> optional : 값이 있을수도 있고, 없을 수도 있어서.
// 따라서 해당 optional 값을 꺼낸 뒤, 이를 string으로 type casting 도 가능한지 확인
// nil 이 아니라, 문자열 타입으로 나온다면 그제서야 okay -> 다음 가드로 이동
// 두 가드 모두 통과하면 프린트!
// 이게 if-else 구문과 비슷하지만, 빠르게 return. 조기 종료 시키기 위해서
// 조건 판단 여부로 간략하게 사용하는 구문이라고 보면 된다!



 someFunction(info: ["name": "jenny", "age": "10"])
 someFunction(info: ["name": "mike"])
 someFunction(info: ["name": "yagom", "age": 10]) // yagom: 10
 
 */
