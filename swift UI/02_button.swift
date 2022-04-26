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
    }

    @IBAction func sliderValueChanged (_ sender : UISlider){
        // 대소문자, 띄어쓰기 매우 중요!
        print(sender.value)
    }
    
    @IBAction func touchUpHitButton (_ sender : UIButton){
        print(slider.value)
    }
}

