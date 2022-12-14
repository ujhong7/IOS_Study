//
//  ViewController.swift
//  MemberList
//
//  Created by yujaehong on 2022/11/30.
//

import UIKit

class ViewController: UIViewController {

    // 테이블 뷰
    private let tableView = UITableView()
    
    var memberListManager = MemberListManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupDatas()
        setupTableView()
        setupNaviBar()
        setupTableViewConstraints()
        
    }
    
    
    func setupNaviBar() {
        title = "회원 목록"
        
        // 네비게이션바 설정관련
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()  // 불투명으로
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        // 네비게이션바 오른쪽 상단 버튼 설정
        // self.navigationItem.rightBarButtonItem = self.plusButton
    }
    
    func setupTableView(){
        tableView.dataSource=self
        tableView.delegate=self
        tableView.rowHeight = 60
        
        tableView.register(MyTableTableViewCell.self, forCellReuseIdentifier: "MemberCell")
    }
    
    func setupDatas(){
        memberListManager.makeMembersListDatas() // 일반적으로는 서버에 요청
    }
    
    
    // 테이블뷰의 오토레이아웃 설정
    func setupTableViewConstraints() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }

}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberListManager.getMembersList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath)
        as! MyTableTableViewCell
        
//        cell.mainImageView.image = memberListManager[indexPath.row].memberImage
//        cell.memberNameLabel.text = memberListManager[indexPath.row].name
//        cell.addressLabel.text = memberListManager[indexPath.row].address
        cell.member = memberListManager[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
     

}


extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        // 다음화면으로 넘어가는 코드
        let detailVC = DetailViewController()
         
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
