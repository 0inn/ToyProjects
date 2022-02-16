//
//  OrderList.swift
//  Starbucks_clone
//
//  Created by 김영인 on 2022/02/15.
//

import UIKit

class OrderVC: UIViewController {

    @IBOutlet weak var bigTitle: UILabel!
    @IBOutlet weak var orderView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .systemBackground
        orderView.delegate = self
        orderView.dataSource = self
    }
}

extension OrderVC: UITableViewDelegate, UITableViewDataSource {
    // 데이터 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    // 데이터 셀 불러오기
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath) as! OrderCell
        cell.selectionStyle = .none // 클릭 시 색상 변경 x
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OrderDetail") as! OrderDetail
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
