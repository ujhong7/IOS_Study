//
//  ViewController.swift
//  DiceGame
//
//  Created by yujaehong on 2022/08/11.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet var firstImageView: UIImageView!
    @IBOutlet var secondImageView: UIImageView!
    
    var diceArray : [UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6")]
    // #imageLiteral(
                               
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstImageView.image = diceArray[0]
        secondImageView.image = diceArray[0]
        
        // Do any additional setup after loading the view.
    }


    
    
    @IBAction func rollBtn(_ sender: Any) {
        firstImageView.image = diceArray.randomElement()
        secondImageView.image = diceArray.randomElement()
        
    }
    
    
}

