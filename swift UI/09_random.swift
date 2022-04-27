//
//  ViewController.swift
//  UpDownGame
//
//  Created by 김소현 on 2022/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    var randomValue : Int = 0
    var tryCount : Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tryCountLabel : UILabel!
    @IBOutlet weak var sliderValueLabel : UILabel!
    @IBOutlet weak var minimumValueLabel : UILabel!
    @IBOutlet weak var maximumValueLabel : UILabel!
    // 선언한 변수의 오타를 고칠때는 꼭 우클릭, refactor, rename 과정으로 수정하기!!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb.png3"), for: .normal)
        
        reset()
    }

    @IBAction func sliderValueChanged (_ sender : UISlider){
        // 대소문자, 띄어쓰기 매우 중요!
        print(sender.value) // view controller error debugging clear! :)
    }
    
    @IBAction func touchUpHitButton (_ sender : UIButton){
        print(slider.value)
    }
    
    @IBAction func touchUpResetButton (_ sender : UIButton){
        reset()
    }
    
    func reset() {
        print("reset")
        randomValue = Int.random(in: 0...30)
        // 폐쇄 연산자 : 양 끝을 모두 포함하는 범위 연산자 0 <= <= 30
        // 반폐쇄 연산자 : 맨 끝 수를 포함하지 않는 (미만) A ..< B
        // 단방향 연산자 3종류 : A ... / ... A / ..< A 등등
    }
}
