//
//  ViewController.swift
//  UpDownGame
//
//  Created by yujaehong on 2022/08/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    
    // 컴퓨터 1~10 랜덤숫자 선택
    var comNumber = Int.random(in: 1...10)
    var myNumber : Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 메인레이블에 준비하세요 표시
        mainLabel.text = "준비하세요"
        // 숫자 레이블은 "" (빈 문자열)
        numberLabel.text = ""
    }

    
    @IBAction func buttonTapped(_ sender: UIButton) {
        // 버튼의 숫자 가져오기
        guard let numString = sender.currentTitle else {return}
        // 숫자 레이블 변하도록 (숫자에 따라)
        numberLabel.text = numString
        // 선택한 숫자를 변수에 저장 (선택사항) 문자열 -> 숫자열 변환 저장
        guard let num = Int(numString) else {return}
        myNumber  = num
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 메인레이블에 준비하세요 표시
        mainLabel.text = "준비하세요"
        // 숫자레이블 "" (빈 문자열)
        numberLabel.text = ""
        // 컴퓨터가 랜덤 숫자를 다시 선택할수 있도록
        comNumber = Int.random(in: 1...10)
    }
    
    
    @IBAction func selectBtuttonTapped(_ sender: UIButton) {
        
        // ******버튼눌러서 값받아오는 또 다른 방법*******
        // 숫자 레이블에 있는 문자열 가져오기
        // guard let myNumString = numberLabel.text else {return}
        // 타입변환 문자열 -> 숫자
        // guard let myNumber = Int(myNumString) else {return}
        // **************************************
        
        
        
        // 컴퓨터가 선택한 숫자와 내가 선택한 숫자 비교 Up / Down / Bingo
        if comNumber > myNumber{
            mainLabel.text = "UP"
        }else if comNumber < myNumber{
            mainLabel.text = "DOWN"
        }else{
            mainLabel.text = "BINGO"
        }
    }
}

