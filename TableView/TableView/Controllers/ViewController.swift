//
//  ViewController.swift
//  TableView
//
//  Created by yujaehong on 2022/11/18.
//

import UIKit

class ViewController: UIViewController {

    // 테이블뷰의 데이터를 표시하기 위한 배열
    var moviesArray : [Movie] = []
    // MVC패턴을 위한 데이터 매니저 (배열관리 - 데이터)
    var movieDataManger = DataManger()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 델리게이트 패턴의 대리자 설정
        tableView.dataSource = self
        tableView.delegate = self
        // 셀높이 설정
        tableView.rowHeight = 120
        
        title = "영화목록"
        
        // 일반적으로는 서버에 요청
        movieDataManger.makeMovieData()
        // 데이터 받아서 뷰컨의 배열에 저장
        moviesArray = movieDataManger.getMovieData()
        
    }


    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        
        movieDataManger.updateMoiveData()   // 일반적으로는 서버에 요청 (데이터 업데이트)
        moviesArray = movieDataManger.getMovieData()  // 다시 데이터 받아서 뷰컨의 배열에 저장
        tableView.reloadData()   // 테이블뷰를 다시 불러오기
    }
    
    
}

extension ViewController : UITableViewDataSource{

    // 1) 테이블뷰에 몇개의 데이터를 표시할 것인지(셀이 몇개인지)를 뷰 컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    // 2) 셀의 구성(셀에 표시하고자 하는 데이터 표시)을 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        cell.mainImageView.image = moviesArray[indexPath.row].movieImage
        cell.movieNameLabel.text = moviesArray[indexPath.row].movieName
        cell.descriptionLabel.text = moviesArray[indexPath.row].movieDescription
        
        
        
        return cell
    }

}


extension ViewController: UITableViewDelegate{
    // 셀이 선택 되었때 어떤 동작을 할 것인지 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 세그웨이 실행
        performSegue(withIdentifier: "toDetail", sender: indexPath)
        
    }
    // prepare세그웨이 (데이터전달)
    override func prepare(for segue: UIStoryboardSegue, sender:Any?){
        if segue.identifier == "toDetail"{
            let detailVC = segue.destination as! DetailViewController
            let array = movieDataManger.getMovieData()
            let indexPath = sender as! IndexPath
            
            // 배열에서 아이템을 꺼내서, 다음화면으로 전달
            detailVC.movieData = array[indexPath.row]
        }
    }
    
}
