//
//  ViewController.swift
//  SliderTimer
//
//  Created by yujaehong on 2022/08/17.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var slider: UISlider!
    weak var timer: Timer?
    
    var number = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
    
    func configureUI() {
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
    }
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        // 슬라이더의 벨류값을 메인레이블 텍스트에 세팅
        let seconds = Int(slider.value * 60)
        mainLabel.text = "\(seconds)초"
        number = seconds
    }
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // 1초씩 지날때 마다 무언가를 실행
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){
                [self] _ in
                //반복하고 싶은 코드
                    if number > 0{
                    number-=1
                    // 슬라이더 줄이기
                    // 메인레이블 변화
                    slider.value=Float(number)/Float(60)
                    mainLabel.text="\(number)초"
                }else{
                    number=0
                    mainLabel.text="초를 선택하세요"
                    timer?.invalidate()
                    //소리
                    AudioServicesPlayAlertSound(SystemSoundID(1322))
                }
            }
        }
        
        
        
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 초기화 세팅
        mainLabel.text = "초를 선택하세요"
        // 슬라이더 가운데 설정
        slider.setValue(0.5, animated: true)
        number=0
        timer?.invalidate()
    }
    
}
