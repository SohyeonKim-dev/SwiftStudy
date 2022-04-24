import Swift

/* 고차함수

'다른 함수를 전달인자로 받거나 함수 실행의 결과를 함수로 반환하는 함수'를 뜻합니다.
 스위프트의 함수(클로저)는 일급시민이기 때문에 함수의 전달인자로 전달할 수 있으며, 함수의 결과값으로 반환할 수 있습니다.
 이번 파트에서는 스위프트 표준라이브러리에서 제공하는 유용한 고차함수에 대해 알아봅니다.

 - map
 - filter
 - reduce
 
 map, filter, reduce 함수는 스위프트 표준 라이브러리의
 컨테이너 타입(Array, Set, Dictionary 등)에 구현되어 있습니다.

 */


// 1) map : map함수는 컨테이너 내부의 기존 데이터를 변형(transform)하여 새로운 컨테이너를 생성합니다.
// mapping 한다 할때의 그 의미 맞음 !

 
 // 변형하고자 하는 numbers와 변형 결과를 받을 doubledNumbers, strings

 let numbers: [Int] = [0, 1, 2, 3, 4]
 var doubledNumbers: [Int]
 var strings: [String]
 

 // 기존의 for 구문 사용
 doubledNumbers = [Int]()
 strings = [String]()

 for number in numbers {
     doubledNumbers.append(number * 2)
     strings.append("\(number)")
 }

 print(doubledNumbers) // [0, 2, 4, 6, 8]
 print(strings) // ["0", "1", "2", "3", "4"]




 // map 메서드 사용
 // numbers의 각 요소를 2배하여 새로운 배열 반환 : 클로저 사용
 doubledNumbers = numbers.map({ (number: Int) -> Int in
     return number * 2
 })

 // numbers의 각 요소를 문자열로 변환하여 새로운 배열 반환
 strings = numbers.map({ (number: Int) -> String in
     return "\(number)"
 })

 print(doubledNumbers) // [0, 2, 4, 6, 8]
 print(strings) // ["0", "1", "2", "3", "4"]



 // 매개변수, 반환 타입, 반환 키워드(return) 생략, 후행 클로저 : 더 간결한 표현 가능!
 // $0 으로 대상이 표현됨 -> sul ma.. 이거 스택으로 구현된건가.?!

 doubledNumbers = numbers.map { $0 * 2 }
 print(doubledNumbers) // [0, 2, 4, 6, 8]
 



 // 2) filter : filter함수는 컨테이너 내부의 값을 걸러서 새로운 컨테이너로 추출합니다.
 // 필터링한다 그 의미로 받아들이면 될 듯!

 // 기존의 for 구문 사용
 // 변수 사용에 주목하세요
 var filtered: [Int] = [Int]()

 for number in numbers {
     if number % 2 == 0 {
         filtered.append(number)
         // 조건을 만족시키는 경우에 append
     }
 }

 print(filtered) // [0, 2, 4]
 




 // filter 메서드 사용
 // numbers의 요소 중 짝수를 걸러내어 새로운 배열로 반환

 let evenNumbers: [Int] = numbers.filter { (number: Int) -> Bool in
     return number % 2 == 0
     // 해당 조건을 만족하는, 짝수 조건이 걸린 filter를 통과한 애들만 배열에 저장된다!
     // 사알짝 비직관적이지만, 유용하게 사용할 수 있을 듯!
 }

 print(evenNumbers) // [0, 2, 4]



 // 매개변수, 반환 타입, 반환 키워드(return) 생략, 후행 클로저
 let oddNumbers: [Int] = numbers.filter {
     $0 % 2 != 0
     // 음수 조건만!
 }

 print(oddNumbers) // [1, 3]







 // 3) reduce : reduce함수는 컨테이너 내부의 콘텐츠를 하나로 통합합니다.
 // 수행 과정을 줄인다는 의미로 reduce 라고 생각하면 될 듯!


 // 통합하고자 하는 someNumbers
 let someNumbers: [Int] = [2, 8, 15]

 // 기존의 for 구문 사용 : 변수 사용에 주목하세요
 var result: Int = 0

 // someNumbers의 모든 요소를 더합니다
 for number in someNumbers {
     result += number
 }

 print(result) // 25






 // reduce 메서드 사용
 // 초깃값이 0이고 someNumbers 내부의 모든 값을 더합니다.

 let sum: Int = someNumbers.reduce(0, { (first: Int, second: Int) -> Int in
     print("\(first) + \(second)") //어떻게 동작하는지 확인해보세요
     return first + second
 })

 print(sum)  // 25



 // 초깃값이 0이고 someNumbers 내부의 모든 값을 뺍니다.
 var subtract: Int = someNumbers.reduce(0, { (first: Int, second: Int) -> Int in
     //print("\(first) - \(second)") //어떻게 동작하는지 확인해보세요
     return first - second
 })

 print(subtract) // -25

 // 초깃값이 3이고 someNumbers 내부의 모든 값을 더합니다.
 let sumFromThree = someNumbers.reduce(3) { $0 + $1 }

 print(sumFromThree) // 28



/*
 
 reduce 메서드에 전달하는 클로저의 매개변수 이름을 first, second 보다는
 result, currentItem과 같은 이름으로 정정하는 것이 좋겠습니다. : ㅇㅈ.. 헷갈림
 
 첫 번째 매개변수는 초깃값으로부터 출발하여 마지막 요소까지 순회하는 내내의 결괏값입니다.
 currentItem은 현재 순회하고 있는 요소의 값을 뜻합니다. : 아아ㅏ!!
 결국 return result + currentItem이라고 표현한다면 이제까지 더해진 결괏값에 이번 요소의 값을 더한다는 뜻이 되겠습니다.
 
 */
