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

    override func viewDidLoad() {
        super.viewDidLoad()
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb.png3"), for: .normal)
        
        reset()
    }

    @IBAction func sliderValueChanged (_ sender : UISlider){
        print(sender.value)
        let integerValue : Int = Int(sender.value)
        // 기존의 typecasting -> 괄호를 활용하면 된다
        sliderValueLabel.text = String(integerValue)
    }
    
    @IBAction func touchUpHitButton (_ sender : UIButton){
        print(slider.value)
        let hitValue: Int = Int(slider.value)
        // 우리가 hit하는 값은 정수로 받음
        // 그러나 slider는 실수를 받아야 해서, 다시 정수를 실수형으로 변환해서 slider에 넣어준다.
        slider.value = Float(hitValue)
    }
    
    @IBAction func touchUpResetButton (_ sender : UIButton){
        reset()
    }
    
    func reset() {
        print("reset")
        randomValue = Int.random(in: 0...30)
        // print(randomValue)
        tryCount = 0
        tryCountLabel.text = "0 / 5"
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        minimumValueLabel.text = "0"
        maximumValueLabel.text = "30"
        sliderValueLabel.text = "15"
    }
}
