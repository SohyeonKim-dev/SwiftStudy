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
        sliderValueLabel.text = String(integerValue)
    }
    
    
    @IBAction func touchUpHitButton (_ sender : UIButton){
        print(slider.value)
        let hitValue: Int = Int(slider.value)
        slider.value = Float(hitValue)
        
        tryCount = tryCount + 1
        tryCountLabel.text = "\(tryCount) / 5"
        
        // 종료 조건
        
        if randomValue == hitValue {
            print("You Hit!")
            reset()
            return
        }
        
        else if tryCount >= 5 {
            print("You Lose.. :( ")
            reset()
            return
        }
        
        // 슬라이드 경계값 변경 작업 : 같은 경우는 고려 안해도 된다! -> 그건 정답이니까 앞에서 걸러짐
        
        if randomValue > hitValue {
            slider.minimumValue = Float(hitValue)
            minimumValueLabel.text = String(hitValue)
        }
        
        else if randomValue < hitValue {
            // else로 바꿔도 괜찮음!
            slider.maximumValue = Float(hitValue)
            maximumValueLabel.text = String(hitValue)
        }
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
