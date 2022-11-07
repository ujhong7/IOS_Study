//
//  ThirdViewController.swift
//  NextVC
//
//  Created by yujaehong on 2022/11/06.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    var someString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainLabel.text
    }
    

    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
