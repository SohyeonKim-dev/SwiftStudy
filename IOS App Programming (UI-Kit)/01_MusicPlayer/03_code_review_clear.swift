//
//  ViewController.swift
//  MusicPlayer
//
//  Created by 김소현 on 2022/05/12.
//


import UIKit
import AVFoundation

// shift + command + O -> 빠른 찾기 단축키 : open quickly



class ViewController: UIViewController, AVAudioPlayerDelegate {
    // swift는 다중 상속을 지원하지 않는다는데? 얘는 뭐임?

    // MARK:- Properties
    var player: AVAudioPlayer!
    var timer: Timer!
    
    // 값이 있을 수도 있고, 없을 수도 있는 변수를 정의할 때에는 옵셔널을 활용한다.
    // 옵셔널 변수에 초기값을 저장하지 않으면, 기본 값은 nil
    // 옵셔널 아니면, nil 값을 넣고 싶어도 에러가 발생하기 때문에 등장한 개념
    // -> 엄격한 타입 캐스닝에 따른 후속 조치 느낌이구만
    
    // MARK: IBOutlets
    @IBOutlet var playPauseButton: UIButton!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var progressSlider: UISlider!
    
    /*
     
     IBOutlet 의미? -> 스토리보드와의 연결 고리를 의미한다.
     IBAction : 이벤트가 발생할 경우 일어나는 행동을 정의
     IBOutlet : 값에 접근하기 위한 변수
     
     IB : interface builder
     
     @ : 컴파일러에게 어떤 속성을 갖고 있다고 전하는 예약어
     
     ! : 개발자가 여기에는 nil 값이 없다고 확신할 때 사용
     ? : 개발자가 여기에는 nil 값이 있을 수 있을때 사용
     
     
     */
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.addViewsWithCode()
        self.initializePlayer()
    }
    
    /*
     
     
     * override -> 부모 클래스의 메소드를 자식 클래스에서 재정의 하는 것
     
     출처: https://www.devkuma.com/docs/swift/메소드-오버라이드-override/
     상속을 이용하면 이미 있는 클래스에 새로운 기능을 추가할 수 있는 것은 알았다. 하지만 그것만으로는 부족한다.
     이미 있는 클래스의 기능을 변경할 수 있어야 한다.

     여기에는 ‘오버라이드(override)‘라는 기능을 사용한다. : 오버라이드는 슈퍼 클래스에 있는 메소드를 재정의 !
     
     
     
     import Cocoa

     class Helo {
         var name:String = "Taro";
        // 문장 끝에 ; 안 붙여도 되는거 아닌가?
        // 문자열 변수 name을 선언한 뒤, "Taro" 라는 값으로 초기화 했다.
        // 멤버 변수겠지! class 내부의!
         
         func say(){
             print("Hello, " + name + "!");
         }
        // 부모 클래스의 멤버 함수 (메소드)
        // 문자열 보간법 사용해도 좋을 듯 함.
     }

     class Hello:Helo {
         var name2:String = "YAMADA";
         
         override func say(){
             print("Hi," + name + "-" + name2 + "!");
     
        // 아!! 보통은 함수 선언할 때 func 붙이면 끝인데,
        // 부모 클라스의 메소드에 오버라이드 할 때에는 앞에 override 를 붙이면 된다.
     
         }
     }

     var obj:Hello = Hello();
     // 자식 클래스의 객체 하나 생성
     obj.say();
     // 객체의 메소드 호출

     obj.name = "Hanako";
     obj.name2 = "TANAKA";
     obj.say();
     
     
     */
    

    // MARK: - Methods
    // MARK: Custom Method
    func initializePlayer() {
        
        guard let soundAsset: NSDataAsset = NSDataAsset(name: "sound") else {
            print("음원 파일 에셋을 가져올 수 없습니다")
            return
        }
        
        /*
         
         guard ? guard문으로 함수 입구 틀어막기!
         출처: https://dev200ok.blogspot.com/2020/10/swift-guard.html
         
         특정 조건으로 부터 guard 해줍니다.
         : if 문의 subset -> 완벽히 대체 가능함 but, 가독성을 높이기에 사용한다.
         조건이 틀린 경우는 모두 버리고, 우리가 원하는 조건만 통과 시키겠다는 의미 입니다.
         마치 성문 앞에서 통행증을 보고 통과 시켜주는 가드가 생각나는군요.
         
         guard문은 조건이 맞지 않으면 종료 시켜야 하도록 문법이 되어있기 때문에,
         반드시 return이나 throw를 해주어야 합니다.
         반대로 말하면 함수 내부에서 사용하도록 만들어진 녀석이죠.
         
         func guardTest() {
             let condition1: Bool = true
             let condition2: Bool = true
         
             guard condition1,condition2 else {
                 return print("Bye!")
             }
             print("Come In!")
         }
         guardTest()
         
         // -> 오.. 이거 이해 잘 된다.
         
         개인적으로 느낀 장점은 코드의 가독성이 좋아집니다.
         예를 들면 우리가 어떤 함수에서 실행해야 하는 조건이 3개라면, if문으로 썼을 때는 다음과 같습니다.

         func solution() {
             if condition1 {
                 if condition2 {
                     if condition3 {
                         print("Come In")
                     }
                     else {
                         print("Bye!")
                     }
                 } else {
                     print("Bye!")
                 }
             } else {
                 print("Bye!")
             }
         }
         
         
         물론 조건문을 좀 더 이쁘게 쓰면 가독성이 좋아질 수 있습니다.
         다음은 가드를 사용했을 때 입니다.

         func solution() {
             guard condition1 else { return print("Bye!") }
             guard condition2 else { return print("Bye!") }
             guard condition3 else { return print("Bye!") }

             print("Come In")
         }
         
         
         이 함수가 무엇을 하고 싶은지 좀 더 명확하게 보입니다. -> wow
         
         + 용법 정리
         guard " 조건 " else { 조건이 false 일 때 실행될 구문 }
         
         
         * guard로 옵셔널 바인딩
         
         func printMessage(_ message: String?) {
            // 함수의 매게 변수를 optional로 받음
            // _ 무슨 의미임? -> 뒤에 따로 빼서 조사하자 ( underscore)
         
             guard let letMessage = message else { return }
             print(letMessage)
         }
         printMessage(string)
         
         // 잠만 이 경우에는 미리 letMessage가 뭐 string으로 선언된 경우인가?
         
         guard를 사용하면 if 로 옵셔널 바인딩했을 때와 달리 { } 괄호 밖에서도 사용 가능
         -> 오! 그렇네.. 뭔가 optional 정의랑 잘 맞아떨어지는 것 같다! :)
         둘이 같이 활용하면 좋을 듯?! optional 값이 우리가 원하는 type data 맞는지 확인하고
         조건에 따라 추후 행동들을 판단하면 ?! goood
         
         
         
         
         
         * 옵셔널 바인딩과 체이닝의 차이
         
         - 옵셔널 바인딩 ( optional binding )
         ! 을 사용하지 않고 새로운 상수를 선언한 뒤 상수에 옵셔널 변수의 값을 넣어보고, nil이 아니면 연산에 사용
         : (! : 강한 확신이 있을 경우 사용하는 것)
         : let 으로 선언할 때에는, 그럼 해당 변수의 type이 무엇인지 미리 정의 안해도 됨? : string이런거..
         
         + if let nonOptionalVariable = OptionalVariable { 연산 } 의 방식으로 사용합니다.
         
         
         - 옵셔널 체이닝 ( optional chaining )
         옵셔널 언래핑은 실행 했을때 값이 없으면 에러가 발생하지만, 체이닝은 런타임 에러 대신 nil 값을 반환하는 특징이 있습니다.
         따라서 체이닝의 결과는 항상 옵셔널 값이 됩니다.
         
         */
        
        
        
        
        
        
        
        /*
         
         1.  함수에서 _의 의미 (underscore)
         
         
         func greet(person: String, day: String) -> String {
          return “Hello \(person), today is \(day).”
         }
         
         greet(person: “Bob”, day: “Tuesday”)
         
         
         위의 예제에서는 간단한 함수 greet이 선언되어 있습니다.
         별 문제 없어 보입니다.(실제로 별 문제 없습니다.)
         다음은 _ 이 있는 함수를 봐보겠습니다.
         
         
         func greet(name person: String, _ day: String) -> String {
          return “Hello \(person), today is \(day).”
         }
         
         greet(“John”, on: “Wednesday”)
         
         
         동일한 함수 greet를 작성했는데 이번에는 _ 이 있습니다.
         물론 이 함수도 정상 작동합니다. 둘 사이의 차이는 무엇일까요?
         눈썰미가 좋은 분들은 이미 보셨겠지만, 함수 호출에서 그 차이가 있습니다.

         greet(person: “Bob”, day: “Tuesday”)
         greet(name: “John”, “Wednesday”)
         
         뭔가 다르다!
         
         네, Swift에서는 함수를 호출할 때, 함수로 전달하는 인자(argument)의 라벨이 있어야 합니다.
         즉, person: “Bob” 에서 person 부분이 있어야 한다는 것입니다.
         그렇다면 person 과 day 라벨은 어디서 온 것일까요? 바로 함수 선언시 argument의 이름입니다.
         
         Swift는 함수의 argument 앞에 특정 라벨을 붙일 것을 요구합니다.
         argument의 이름을 붙인다고 생각하면 쉬울 것 같습니다.
         다만, 따로 라벨을 쓰지 않으면 default값으로 함수 선언시 사용한 argument를 라벨로 사용합니다.
         그렇다면 두 번째 함수 호출은 어떻게 된 것일까요? 먼저 name: 부분은 argument 작성 시
         name person: String 부분에서 따로 라벨을 설정해준 것을 확인할 수 있습니다.
         
         자 그 다음은 _ 입니다. 보이시나요?
         greet 함수 호출시 파라미터 앞에 라벨이 없습니다.
         네, _ 는 이처럼 argument에 라벨을 따로 붙이고 싶지 않을 때 사용합니다.
         
         정리하자면,
         Swift는 함수 호출시 넘기는 파라미터 앞에 라벨을 생략하기 위해 _ 를 사용한다.

         
         func iGotIt(_ understand: String, _ argument: String, _ label: String) -> String {
          return “Are \(understand) \(argument) \(label)?”
         }
         print(iGotIt(“you”, “understand”, “label”))
         
         마지막 예제처럼 기이하게 함수를 호출해도 무슨 말인지 이해하시겠죠?
         : cpp 에서는 파라미터 임시 이름 필요 없었는데, swift 에서는 명시하는 것이 디폴트!
        
         
         
         
         2. for 문 에서의 _
         
         _ (underscore)는 for loop에서도 종종 발견됩니다.

         for _ in 0..<4 {
          print(“hello”)
         }
         
         for index in 0..<4 {
          print(“hello \(index)”)
         }
         
         위의 _ 는 for loop에서 인덱스를 할당하지 않겠다는 의미로 사용됩니다.
         : 반복 횟수 설정만 신경쓸 경우에!
         
         출처: https://medium.com/@codenamehong/swift-underscore-90dcbec5072f
         
         */
        
        
        
        
        /*
         
         self는 어떨때 사용?
         
         타입의 모든 인스턴스는 암시적으로 생성된 self 프로퍼티를 갖는다.
         이것은 인스턴스 자기 자신을 가리키는 프로퍼티이다.
         self 프로퍼티는 인스턴스를 더 명확히 지칭하고 싶을 때 사용하게 된다.
         self 프로퍼티를 사용하여 자체 인스턴스 메서드 내에서 현재 인스턴스를 참조할 수 있다.
         
         
         func levelUp() {
           self.level += 1
         }
         
         // class에 정의된 인스턴스 프로퍼티를 지칭
         // 메소드 바깥의, instance 내부의 data를 가져올 때!

         
         Swift에서의 프로퍼티 사용 순서는 자동으로
         메서드 내부에 선언된 지역변수 ➜ 메서드 매개변수 ➜ 인스턴스 프로퍼티
         순으로 찾아 무엇을 지칭하는지 유추하게 된다.


         class letterClass {
           var name: String = ""
           
           func sendLetter(to name: String) {
              print("\(name)에게 편지를 보냅니다.")
              self.name = name
           }
         }
         
         // 여기서 self.name은 인스턴스 프로퍼티 의미
         -> 그냥 name 은 to name 의미 (매개변수)
         -> 그냥 name 이라 쓰면, func 내부에서 찾아야 하니깐.
         
          
         let Myletter: letterClass = letterClass()
         Myletter.sendLetter(to: "서근")
         
         출처 : https://seons-dev.tistory.com/121
         
         */
        
        
        do {
            try self.player = AVAudioPlayer(data: soundAsset.data)
            self.player.delegate = self
        } catch let error as NSError {
            print("플레이어 초기화 실패")
            print("코드 : \(error.code), 메세지 : \(error.localizedDescription)")
        }
        
        self.progressSlider.maximumValue = Float(self.player.duration)
        self.progressSlider.minimumValue = 0
        self.progressSlider.value = Float(self.player.currentTime)
    }
    
    
    /*
     
     do - catch 구문 (예외, 오류 처리)
     
     오류 처리에는 다음 세 가지 과정이 필요합니다
     1) 오류의 종류 정의하기 -> enum
     2) 발생한 오류 던지기 -> throw
     3) 던진 오류 처리하기
     
     
     1. 오류의 종류 정의하기 (선택사항)
     
     먼저 오류의 종류를 enum(열거형)으로 정의
     
     enum 오류종류이름 : Error {
          case 종류1
          case 종류2
            .
            .
            .
     }
     
     
     실전 예제)
     
     enum TestError : Error {
          case outOfRange                      // 1
          case invalidInput(testNum : Int)     // 2
     }
     
     1번은 기본적인 enum 케이스이고, 2번은 parameter를 받는 케이스입니다
     예외상황이 많아질수록 케이스가 늘어날 수 있습니다.
     그런데 1번 제목 옆에 ‘선택사항'이라고 써놨죠?
     그 이유는 굳이 케이스별로 오류처리하지 않을 때도 있기 때문 !
     그냥 간단하게 에러 출력하실거면 건너뛰도 됩니다.
     
     
     2. 발생한 오류 던지기
     오류는 throws 를 이용해 던집니다 : 오류를 던진다 = 오류를 처리해주는 곳으로 전달해준다
     오류 처리하는 건 아래 3번에서 다룰 예정이니, 지금은 오류를 어떻게 던지는지에 집중해보겠습니다.
     
     
     func printNumber(_ number: Int) -> Int {
        var text = ""
       
        guard number > 0 else { return } // *
        return text
     }
     
     자, 위에 printNumber()라는 메소드가 있습니다.
     그런데 중간 별표시된 부분에서 guard문을 썼습니다.
     오류가 발생할 수도 있다는 얘기죠. -> 그럼 오류를 던져야겠죠? -> throw 써줘야겠죠?
     
     
     throw는 총 두 군데에 써줍니다. ( 왜? )
     
     func printNumber(_ number: Int) throws -> Int {    // 1
        var text = ""
       
        guard number > 0 else {
            throw TestError.outOfRange                // 2
        }
        return text
     }
     
     
     첫번째 throws는 오류가 발생할 가능성이 있는 메소드 제목 옆에 써줍니다.
     두번째 throw ( ‘s’ 없음)은 오류가 발생할 구간에서 써줍니다.
     그런데 위에 변수를 받는 케이스도 써줬죠?
     
     enum TestError : Error {
        case outOfRange                      // 1
        case invalidInput(testNum : Int)     // 2
     }
     
     여기서 2번이요. 이럴 경우엔 다음처럼 하면 됩니다.
     
     
     func printNumber(_ number: Int) throws -> Int {
        var text = ""
       
        guard number > 0 else {
           throw TestError.invalidInput(testNum: number)
        }
        return text
     }
     
     * 꼭 number가 아니어도 넘겨주고 싶은 값을 넘겨주면 됩니다.
     
     
     
     3. 던진 오류 처리하기 : 오류 처리는 try와 do-catch로 합니다.
     
     다시 printNumber 함수로 돌아가볼게요
     
     
     func printNumber(_ number: Int) throws -> Int {
        var text = ""
       
        guard number > 0 else {
        throw TestError.outOfRange
        }
        return text
     }
     
     
     해당 경우, throw로 예외를 던져줬습니다. -> 예외를 받는 곳은 그럼 어디냐.
     : printNumber() 메소드를 사용하는 곳
     
     예를들어,
     
     class Object {
         func printNumber(_ number: Int) throws -> Int {
        
                .......
         }
     }
     
     printNumber() 메소드가 클래스 Object 안에 있었다고 가정해볼게요.
     우선 Object 인스턴스를 만들어주고
     let object = Object()
     
     printNumber() 메소드를 호출해줍니다.
     let resultNumber = object.printNumber(-20)
     
     어라, 근데 printNumber에 변수로 -20이라는 음수값을 넣어줬습니다.
     위의 호출로 오류가 발생하겠죠?
     이때 오류가 발생하는 메소드는 try를 써줘야합니다.
     따라서 위의 방식이 아니라
     
     let resultNumber = try object.printNumber(-20)
     이렇게 try를 넣어줍니다!
     ** 오류 발생하는 메소드 앞에 말이죠.
     : Ah-ha : 활용하는 방법은 미리 try 를 쓰는 거구만 :)
     
     
     func printNumber(_ number: Int) throws -> Int {
     위에서 printNumber 뒤에 throws를 써줬다는건
     이 함수에서 오류를 던진다는 의미였죠?
     
     try의 의미는 이렇습니다.
     * ‘이 함수가 오류가 발생할 수도 있는데, 한번 시도해볼게요.’
     말 그대로 ‘시도해보겠다'는 선언이죠.
     
     하지만 여기서 끝이 아니라 do-catch로 감싸줘야 처리를 할 수 있습니다. (?!)
     
     do {
        let resultNumber = try object.printNumber(-20)
     } catch {
        
        print(error)
     }
     
     위의 do-catch 문은 오류를 처리하는 가장 간단한 방법입니다.
     1번에서 오류 종류 정의하는 건 선택사항이라고 했죠?
     오류를 정의하지 않아도 기본적으로 이렇게 에러를 출력할 수 있습니다. (아아!)
     
     심지어는 catch를 생략해도 무방합니다.
     do {
        let resultNumber = try object.printNumber(-20)
     }
     
     이렇게요
     하지만 모처럼 오류 케이스를 나누어줬으니,
     활용방법을 알아봅시다.
     
     do {
        let resultNumber = try object.printNumber(-20)
     } catch TestError.outOfRange {
        // 오류처리
     } catch TestError.invalidInput(let testNumber) {
        // 오류처리
     }
     
     위에서 정의한 케이스별로 처리해줍니다
     오류처리까지 채우면 이렇습니다
     
     do {
       let resultNumber = try object.printNumber(-20)
     } catch TestError.outOfRange {
        print("양수가 아니야!")
     } catch TestError.invalidInput(let testNumber) {
        print("부적절한 숫자 \(testNumber)")
     }
     
     // 여기까지 완벽 이해!
     : try와 do-catch 구문의 콜라보로 오류 걸러내기!!
     
     
     케이스별로 처리하기 때문에 switch문으로도 쓸 수 있습니다 (enum 정의된 경우)
     
     do {
        let resultNumber = try object.printNumber(-20)
     } catch {
        switch error {
        case TestError.outOfRange:
            // 오류처리
        case TestError.invalidInput(let number):
            // 오류처리
        }
     }
     
     
     
     + 추가 설명 : try?와 try! (optional 비슷한 개념 -> 확신의 유무)
     
     try는 try?나 try!로 쓸 수 있습니다.
     
     
     1) try?
     
     let resultNumber = try? object.printNumber(20)
     print("\(resultNumber)")   // Optional("20") 또는 nil
     
     printNumber에서 오류가 발생할 수도 있다는 걸 인정하는 겁니다.
     Swift에서 물음표는 옵셔널을 의미하죠.
     따라서 resultNumber가 리턴값을 옵셔널 타입 또는 nil로 받을 수 있게 됩니다.
     
     
     2) try!
     
     let resultNumber = try! object.printNumber(-20)
     print("\(resultNumber)")   // "20"
     
     printNumber 메소드에서 오류가 절!대! 발생하지 않을 자신이 있으면 씁니다.
     오류발생 시 Runtime Error가 발생하고 강제종료됩니다.
     이상입니다.
     
     출처 : https://twih1203.medium.com/swift-예외처리-throws-do-catch-try-하기-c0f320e61f62
     
     */
    
    
    func updateTimeLabelText(time: TimeInterval) {
        let minute: Int = Int(time / 60)
        let second: Int = Int(time.truncatingRemainder(dividingBy: 60))
        let milisecond: Int = Int(time.truncatingRemainder(dividingBy: 1) * 100)
        
        let timeText: String = String(format: "%02ld:%02ld:%02ld", minute, second, milisecond)
        
        self.timeLabel.text = timeText
    }
    
    func makeAndFireTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [unowned self] (timer: Timer) in
          
            if self.progressSlider.isTracking { return }
            
            self.updateTimeLabelText(time: self.player.currentTime)
            self.progressSlider.value = Float(self.player.currentTime)
        })
        self.timer.fire()
    }
    
    func invalidateTimer() {
        self.timer.invalidate()
        self.timer = nil
    }
    
    func addViewsWithCode() {
        self.addPlayPauseButton()
        self.addTimeLabel()
        self.addProgressSlider()
    }
    
    func addPlayPauseButton() {
        
        let button: UIButton = UIButton(type: UIButton.ButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(button)
        
        button.setImage(UIImage(named: "button_play"), for: UIControl.State.normal)
        button.setImage(UIImage(named: "button_pause"), for: UIControl.State.selected)
        
        button.addTarget(self, action: #selector(self.touchUpPlayPauseButton(_:)), for: UIControl.Event.touchUpInside)
        
        let centerX: NSLayoutConstraint
        centerX = button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        
        let centerY: NSLayoutConstraint
        centerY = NSLayoutConstraint(item: button, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 0.8, constant: 0)
        
        let width: NSLayoutConstraint
        width = button.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5)
        
        let ratio: NSLayoutConstraint
        ratio = button.heightAnchor.constraint(equalTo: button.widthAnchor, multiplier: 1)
        
        centerX.isActive = true
        centerY.isActive = true
        width.isActive = true
        ratio.isActive = true
        
        self.playPauseButton = button
    }
    
    func addTimeLabel() {
        let timeLabel: UILabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(timeLabel)
        
        timeLabel.textColor = UIColor.black
        timeLabel.textAlignment = NSTextAlignment.center
        timeLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        
        let centerX: NSLayoutConstraint
        centerX = timeLabel.centerXAnchor.constraint(equalTo: self.playPauseButton.centerXAnchor)
        
        let top: NSLayoutConstraint
        top = timeLabel.topAnchor.constraint(equalTo: self.playPauseButton.bottomAnchor, constant: 8)
        
        centerX.isActive = true
        top.isActive = true
        
        self.timeLabel = timeLabel
        self.updateTimeLabelText(time: 0)
    }
    
    func addProgressSlider() {
        let slider: UISlider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(slider)
        
        slider.minimumTrackTintColor = UIColor.red
        
        slider.addTarget(self, action: #selector(self.sliderValueChanged(_:)), for: UIControl.Event.valueChanged)
        
        let safeAreaGuide: UILayoutGuide = self.view.safeAreaLayoutGuide
        
        let centerX: NSLayoutConstraint
        centerX = slider.centerXAnchor.constraint(equalTo: self.timeLabel.centerXAnchor)
        
        let top: NSLayoutConstraint
        top = slider.topAnchor.constraint(equalTo: self.timeLabel.bottomAnchor, constant: 8)
        
        let leading: NSLayoutConstraint
        leading = slider.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16)
        
        let trailing: NSLayoutConstraint
        trailing = slider.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16)
        
        centerX.isActive = true
        top.isActive = true
        leading.isActive = true
        trailing.isActive = true
        
        self.progressSlider = slider
    }
    
    // MARK: IBActions
    @IBAction func touchUpPlayPauseButton(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            self.player?.play()
        } else {
            self.player?.pause()
        }
        
        if sender.isSelected {
            self.makeAndFireTimer()
        } else {
            self.invalidateTimer()
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        self.updateTimeLabelText(time: TimeInterval(sender.value))
        if sender.isTracking { return }
        self.player.currentTime = TimeInterval(sender.value)
    }
    
    
    // MARK: AVAudioPlayerDelegate
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        
        guard let error: Error = error else {
            print("오디오 플레이어 디코드 오류발생")
            return
        }
        
        let message: String
        message = "오디오 플레이어 오류 발생 \(error.localizedDescription)"
        
        let alert: UIAlertController = UIAlertController(title: "알림", message: message, preferredStyle: UIAlertController.Style.alert)
        
//        let okAction: UIAlertAction = UIAlertAction(title: "확인", style:
//
//                                                        UIAlertController.Style.alert) { (action: UIAlertAction) -> Void in
//
//            self.dismiss(animated: true, completion: nil)
//        }
//
//        alert.addAction(okAction)
//        self.present(alert, animated: true, completion: nil)
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.playPauseButton.isSelected = false
        self.progressSlider.value = 0
        self.updateTimeLabelText(time: 0)
        self.invalidateTimer()
    }
    
}


/*
 
 let으로 변수선언할 때, 왜 type 안씀?
 : 값의 타입이 명확하다면 안써도 된다.
 
 ex) let var1 : Int = 10;
 ex) let var2 = 20;
 // 둘 다 오류 없이 돌아가긴 하는구나.. 
 
 
 */
