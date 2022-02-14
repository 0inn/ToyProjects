//
//  MovieVC.swift
//  Movie_demo
//
//  Created by 김영인 on 2022/02/10.
//

import UIKit
import SnapKit
import Alamofire    // 비동기 처리

class MovieVC: UIViewController {
    
    var movielist = [Movie]()
    var minRate = Int()
    var tableView = UITableView()
    var activityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTable()
        getData()
        setactivityIndicator()
    }

    func setactivityIndicator() {
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
    }
    
    func getData() {
        activityIndicator.startAnimating()
        
        // param : limit(10), minimum_rating(minRate)
        let parameters: [String: Any] = [
            "limit": 10,
            "minimum_rating": minRate
        ]
        let url = "https://yts.mx/api/v2/list_movies.json"
        AF.request(url, method: .get, parameters: parameters)
            .responseJSON { response in
                //print(response)
                let result = response.data
                do {
                    let json = try! JSONDecoder().decode(MovieResponse.self, from: result!)
                    self.movielist = (json.data?.movies)!   // movielist에 json으로 받아온 데이터 담기
                    print(self.movielist)
                    self.tableView.reloadData() // tableView에 표시
                    self.activityIndicator.stopAnimating()  // loading 멈춤
                    self.movielist.sort{ return ($0.rating! < $1.rating!)}  // 평점순으로 정렬
                } catch {
                    print("error!")
                }
        }
    }
    
}



extension MovieVC:  UITableViewDataSource, UITableViewDelegate {
    
    // 위치 설정
    func setTable(){
        tableView.rowHeight = 50    // cell 높이 설정
        tableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell") // cell 등록
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.snp.makeConstraints{
            $0.width.equalToSuperview()
            $0.height.equalToSuperview()
        }
    }
    
    // 데이터 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movielist.count
    }

    // movielist.count만큼 cell을 반복
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // dequeueResuableCell : 재사용가능한 cell을 정의하여 tableview에 넣음
        // as?(타입을 안전하게 추론) as!(강제로 변환) -> 친자 확인하기 위함
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell

        cell.title.text = movielist[indexPath.row].title
        cell.rating.text = String(movielist[indexPath.row].rating!)

        return cell
    }
    
    // cell 클릭 이벤트
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let movie = movielist[indexPath.row]
        let vc = ShowDetail()
        vc.s_title = movie.title    // 데이터 값 넘겨줌
        vc.s_rating = movie.rating
        vc.s_image = movie.medium_cover_image
        navigationController?.pushViewController(vc, animated: false)   // navigation controller와 뷰 전환
    }
    
}
