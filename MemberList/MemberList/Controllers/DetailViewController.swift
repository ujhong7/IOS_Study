//
//  DetailViewController.swift
//  MemberList
//
//  Created by yujaehong on 2022/12/01.
//

import UIKit

final class DetailViewController: UIViewController {

    private let detailView = DetailView()
    
    var member: Member?
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupButtonTapped()
    }
    
    func setupButtonTapped(){
        detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    @objc func saveButtonTapped(){
        print("버튼이 눌림")
    }

}
