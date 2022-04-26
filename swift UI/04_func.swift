//
//  ViewController.swift
//  UpDownGame
//
//  Created by 김소현 on 2022/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb.png"), for: .normal)
    }

    @IBAction func sliderValueChanged (_ sender : UISlider){
        // 대소문자, 띄어쓰기 매우 중요!
        print(sender.value)
        // slider 오류 발생(cmt + R -> 안 뜸), app icon 때문인가?
        // IBAction : interface와 연결되는 함수라는 의미!
    }
    
    @IBAction func touchUpHitButton (_ sender : UIButton){
        print(slider.value)
    }
    
    @IBAction func touchUpResetButton (_ sender : UIButton){
        print("touch up reset button")
    }
}
// class 내부의 함수들 -> 메소드 method 
