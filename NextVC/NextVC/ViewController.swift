//
//  ViewController.swift
//  NextVC
//
//  Created by yujaehong on 2022/11/05.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func codeNextButtonTapped(_ sender: UIButton) {
        let firstVC =  FirstViewController()
        firstVC.modalPresentationStyle = .fullScreen
        self.present(firstVC, animated: true)
    }
    
    
    @IBAction func storyboardWithCodeButtonTapped(_ sender: UIButton) {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as! SecondViewController
        secondVC.someString="두번째 화면"
        self.present(secondVC, animated: true )
    }
    
    
    
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
         self.performSegue(withIdentifier: "toThirdVC", sender: self)
    }
    
 
    
    
}

