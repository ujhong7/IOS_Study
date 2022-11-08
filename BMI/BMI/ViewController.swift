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
    
    var bmi: Double?
    
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
        //  BMI 결과값을 뽑아냄
        guard let height = heightTextField.text,
              let weight = weightTextField.text else{return}
        
        bmi = calculateBMI(height: height, weight: weight)
    }
    
    // 넘어가는거 허락ox
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
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="toSecondVC"{
            let secondVC = segue.destination as! SecondViewController
            
            // 계산된 결과값을 다음화면에 전달
            secondVC.bmiNumber = self.bmi
            secondVC.bmiColor = getBackgroundColor()
            secondVC.adviceString = getBMIAdviceString()
            
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
    
    // 색깔 얻는 메서드
    func getBackgroundColor() -> UIColor {
        guard let bmi = bmi else { return UIColor.black }
        switch bmi {
        case ..<18.6:
            return UIColor(displayP3Red: 22/255, green: 231/255, blue: 207/255, alpha: 1)
        case 18.6..<23.0:
            return UIColor(displayP3Red: 212/255, green: 251/255, blue: 121/255, alpha: 1)
        case 23.0..<25.0:
            return UIColor(displayP3Red: 218/255, green: 127/255, blue: 163/255, alpha: 1)
        case 25.0..<30.0:
            return UIColor(displayP3Red: 255/255, green: 150/255, blue: 141/255, alpha: 1)
        case 30.0...:
            return UIColor(displayP3Red: 255/255, green: 100/255, blue: 78/255, alpha: 1)
        default:
            return UIColor.black
        }
    }
    
    // 문자열 얻는 메서드
    func getBMIAdviceString() -> String {
        guard let bmi = bmi else { return "" }
        switch bmi {
        case ..<18.6:
            return "저체중"
        case 18.6..<23.0:
            return "표준"
        case 23.0..<25.0:
            return "과체중"
        case 25.0..<30.0:
            return "중도비만"
        case 30.0...:
            return "고도비만"
        default:
            return ""
        }
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

