//
//  ViewController.swift
//  RPSGame
//
//  Created by yujaehong on 2022/08/11.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet var mainLabel: UILabel!
    
    
    @IBOutlet var comImageView: UIImageView!
    @IBOutlet var myImageView: UIImageView!
    
    @IBOutlet var comChoiceLabel: UILabel!
    @IBOutlet var myChoiceLabel: UILabel!
    
    var comChoice : Rps = Rps(rawValue: Int.random(in: 0...2))! // 컴 선택 랜덤초이스
    var myChoice : Rps = Rps.rock
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 첫번째, 두번째 이미지에 준비 이미지 띄워야함
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = #imageLiteral(resourceName: "ready")
        
        // 첫번째, 두번째 레이블에 준비 문자열 띄워야함
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
        
        
    }

    
    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        // RPS (enum)을 선택하고 그 정보를 저장
        // 버튼의 문자를 가져옴
        let title = sender.currentTitle!
        
        switch title{
        case "가위":
            myChoice = Rps.scissors
        case "바위":
            myChoice = Rps.rock
        case "보":
            myChoice = Rps.paper
        default:
            break
        }
        
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
        
        // 컴퓨터가 다시 준비 이미지뷰 표시
        // 컴퓨터가 다시 준비 레이블 표시
        comImageView.image = #imageLiteral(resourceName: "ready")
        comChoiceLabel.text = "준비"
        
        
        // 내 선택 다시 준비 이미지뷰 표시
        // 내 선택 다시 준비 레이블 표시
        myImageView.image = #imageLiteral(resourceName: "ready")
        myChoiceLabel.text = "준비"
        
        // 메인레이블 "선택하세요" 표시
        mainLabel.text = "선택하세요"
        
        // 컴퓨터가 다시 랜덤RPS 선택하고 저장
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
        
        
    }
    
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        // 컴퓨터가 랜덤 선택한 것을 이미지뷰에 표시
        // 컴퓨터가 랜덤 선택한 것을 레이블에 표시
        
        switch comChoice{
        case Rps.rock:
            comImageView.image = #imageLiteral(resourceName: "rock")
            comChoiceLabel.text = "바위"
        case Rps.paper:
            comImageView.image = #imageLiteral(resourceName: "paper")
            comChoiceLabel.text = "보"
        case Rps.scissors:
            comImageView.image = #imageLiteral(resourceName: "scissors")
            comChoiceLabel.text = "가위"
        }
        
        // 내가 랜덤 선택한 것을 이미지뷰에 표시
        // 내가 랜덤 선택한 것을 레이블에 표시
        
        switch myChoice{
        case Rps.rock:
            myImageView.image = #imageLiteral(resourceName: "rock")
            myChoiceLabel.text = "바위"
        case Rps.paper:
            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoiceLabel.text = "보"
        case Rps.scissors:
            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLabel.text = "가위"
        }
        
        // 컴퓨터의 선택과 내 선택을 비교하여 판단/표시
        
        if comChoice == myChoice{
            mainLabel.text = "비겼다"
        }else if comChoice == .rock && myChoice == .paper{
            mainLabel.text = "이겼다"
        }else if comChoice == .scissors && myChoice == .rock{
            mainLabel.text = "이겼다"
        }else if comChoice == .paper && myChoice == .scissors{
            mainLabel.text = "이겼다"
        }else {
            mainLabel.text = "졌다"
        }
        
        
    }
    
    
    

}

