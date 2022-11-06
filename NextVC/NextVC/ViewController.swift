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
    }
    
    
    
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
    }
    
 
    
    
}

