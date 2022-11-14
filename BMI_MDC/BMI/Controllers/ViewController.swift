//
//  ViewController.swift
//  BMI
//
//  Created by yujaehong on 2022/11/08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    // var bmi: Double?
    
    var bmiManager = BMICalculatorManger()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }

    func makeUI(){
        heightTextField.delegate=self
        weightTextField.delegate=self
        mainLabel.text="키와 몸무게를 입력하세요."
        
        calculateButton.clipsToBounds=true
        calculateButton.layer.cornerRadius=5
        calculateButton.setTitle("BMI 계산하기", for: .normal)
        heightTextField.placeholder="cm단위로 입력해주세요"
        weightTextField.placeholder="kg단위로 입력해주세요" 
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
       
    }
    
    // 조건에 따라 이동할지/말지
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if heightTextField.text=="" || weightTextField.text=="" {
            mainLabel.text="키와 몸무게를 입력하세요!!!"
            mainLabel.textColor=UIColor.red
            return false
        }
        mainLabel.text = "키와 몸무게를 입력하세요."
        mainLabel.textColor=UIColor.black
        return true
    }
    
    
    // 다음화면 넘어가기 전 준비 ( 데이터 전달 )
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="toSecondVC"{
            let secondVC = segue.destination as! SecondViewController
            
            // 계산된 결과값을 다음화면에 전달
//            secondVC.bmiNumber = self.bmi
//            secondVC.bmiColor = getBackgroundColor()
//            secondVC.adviceString = getBMIAdviceString()
            
            //비즈니스로직 담당 인스턴스에서 BMI얻어서
            let bmi = bmiManager.getBMI(height: heightTextField.text!, weight: weightTextField.text!)
            
            // (다음화면으로 데이터 전달) BMI 전달
            secondVC.bmi = bmi
            
            // 다음화면으로 가기전 텍스트필드 비우기
            heightTextField.text = ""
            weightTextField.text = ""
            
        }
    }
    
     // BMI계산 메서드
    func calculateBMI(height:String, weight:String )-> Double{
        guard let h = Double(height), let w = Double(weight) else { return 0.0}
        var bmi = w/(h*h)*10000
        bmi = round(bmi*10)/10  // 반올림
        print("BMI결과값:\(bmi)")
        return bmi
    }
    
    
    
    
    
}

extension ViewController: UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // 숫자만 입력
        if Int(string) != nil || string=="" {
            return true // 입력허용
        }
        return false // 입력x
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if heightTextField.text != "", weightTextField.text != ""{
            // 두개의 텍스트필드를 모두 종료 (키보드 내려가기)
            weightTextField.resignFirstResponder()
            return true
            // 두번째 텍스트필드로 넘어가기
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        return false
    }
    
    // 바깥쪽 누를때 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
}

