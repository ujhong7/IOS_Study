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
     
    var bmi:Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeUI()
    }
    
    func makeUI(){
        
        bmiNumberLabel.clipsToBounds=true
        bmiNumberLabel.layer.cornerRadius=8
        bmiNumberLabel.backgroundColor = .gray
        
        backButton.clipsToBounds=true
        backButton.layer.cornerRadius=5
        
        guard let bmi = bmi else {return}
        bmiNumberLabel.text = String(bmi)
        
    }
    
    
   
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    

}
