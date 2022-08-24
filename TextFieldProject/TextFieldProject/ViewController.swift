//
//  ViewController.swift
//  TextFieldProject
//
//  Created by yujaehong on 2022/08/23.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate=self
        setup()
    }
    
    
    func setup(){
        view.backgroundColor = UIColor.gray
        
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "이메일을 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .next
        
        textField.becomeFirstResponder()
        
    }
    
    // 바깥쪽 터치하면 키패드에서 나오기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.resignFirstResponder()
    }
    
    // 텍스트필드 입력을 시작할때 호출 (시작할지 말지 여부를 확인)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 시점
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 입력을 시작했다")
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트 글자내용이 (한글자 한글자) 입력되거나 지워질때 호출 (허락)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(#function)
        
        // 입력되고 있는 글자가 "숫자"인경우 입력 x
        if Int(string) != nil{
            return false
        }else{
            // 10글자 이상 입력 x
            guard let text = textField.text else{return true}
            let newLength = text.count + string.count - range.length
            return newLength <= 10
        }
        
    }
    
    // 텍스트필드의 엔터키가 눌러지면 다음 동작을 허락할 것인지
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        
        if textField.text == ""{
            textField.placeholder = "내용을 입력하세요"
            return false
        } else{
            return true
        }
    }
    
    // 텍스트필드 입력을 끝낼때 호출 (끝낼지 말지 여부를 확인)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트필드 입력이 실제 끝났을때 호출
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 입력을 끝냈다")
        textField.text=""
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        // resign 사임하다 
        textField.resignFirstResponder()
    }
}

