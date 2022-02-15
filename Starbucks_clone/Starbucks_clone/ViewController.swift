//
//  ViewController.swift
//  Starbucks_clone
//
//  Created by 김영인 on 2022/02/14.
//

import UIKit

class ViewController: UIViewController {
    
//    override func loadView() {
//        super.loadView()
//        let myCustomSegmentControl = CustomSegmetnControl(frame: CGRect(x:0, y:0, width:0, height: 200), buttonTitles: ["전체메뉴","나만의 메뉴","홀케이크 예약"])
//
//        self.view.addSubview(myCustomSegmentControl)
//        myCustomSegmentControl.translatesAutoresizingMaskIntoConstraints = false
//        myCustomSegmentControl.widthAnchor.constraint(equalToConstant: 300).isActive = true
//        myCustomSegmentControl.heightAnchor.constraint(equalToConstant: 10).isActive = true
//        myCustomSegmentControl.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
//    }

    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    // 데이터 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    // 데이터 셀 불러오기
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        //let vc = OrderList()
        //navigationController?.pushViewController(vc, animated: false)
    }
}
