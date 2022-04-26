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
    }
}



// 1. view controller에 slier object added
// 2. set Thunb image comment 해제
// 3. self debugging : sucessful!  :)
