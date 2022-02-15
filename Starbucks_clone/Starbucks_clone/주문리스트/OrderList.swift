//
//  OrderList.swift
//  Starbucks_clone
//
//  Created by 김영인 on 2022/02/15.
//

import UIKit

class OrderList: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension OrderList: UITableViewDelegate, UITableViewDataSource {
    // 데이터 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    // 데이터 셀 불러오기
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath) as! OrderCell
        return cell
    }
    
}
