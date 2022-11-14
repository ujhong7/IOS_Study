//
//  SecondViewController.swift
//  BMI
//
//  Created by yujaehong on 2022/11/08.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
     
//    var bmiNumber:Double?
//    var adviceString:String?
//    var bmiColor:UIColor?
    
    // 전화면에서 전달받은 BMI를 저장하기 위한 변수
    var bmi: BMI?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeUI()
    }
    
    func makeUI(){
        // 전화면에서 전달받은 BMI를 통해 셋팅
        bmiNumberLabel.text = "\(bmi!.value)"
        bmiNumberLabel.backgroundColor = bmi?.matchColor
        adviceLabel.text = bmi?.advice
        
        
        bmiNumberLabel.clipsToBounds=true
        bmiNumberLabel.layer.cornerRadius=8
        bmiNumberLabel.backgroundColor = .gray
        
        
        backButton.setTitle("다시 계산하기", for: .normal )
        
        backButton.clipsToBounds=true
        backButton.layer.cornerRadius=5
        
//        guard let bmi = bmiNumber else {return}
//        bmiNumberLabel.text = String(bmi)
//        adviceLabel.text = adviceString
//        bmiNumberLabel.backgroundColor = bmiColor
    }
    
    
   
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    

}
