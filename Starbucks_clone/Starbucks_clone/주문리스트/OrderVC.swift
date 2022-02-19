//
//  OrderList.swift
//  Starbucks_clone
//
//  Created by 김영인 on 2022/02/15.
//

import UIKit

protocol OrderDelgate {
    func passInfo(_ infos: Menu)
}

struct Menu {
    let name: String
    let eng: String
    let price: String
}

class OrderVC: UIViewController {

    @IBOutlet weak var bigTitle: UILabel!
    @IBOutlet weak var orderView: UITableView!
    var drinks = [Menu]()
    
    var delegate: OrderDelgate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderView.delegate = self
        orderView.dataSource = self
        orderView.rowHeight = 150
        setInfo()
    }
    
    @IBAction func goCart(_ sender: Any) {
        let cart = self.storyboard?.instantiateViewController(withIdentifier: "CartVC") as! CartVC
        cart.title = "장바구니"
        self.navigationController?.pushViewController(cart, animated: false)
    }
    
    private func setInfo() {
        drinks = [Menu(name: "봄 딸기 라떼", eng: "Strawberry Milk", price: "6900"), Menu(name: "스프링 가든 자스민 드링크", eng: "Spring Garden Jasmine Drink", price: "6600"), Menu(name: "봄 딸기 그린 크림 프라푸치노", eng: "Spring Strawberry Green \n Cream Frappuccino", price: "6900")]
    }
}

extension OrderVC: UITableViewDelegate, UITableViewDataSource {
    // 데이터 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinks.count
    }
    
    // 데이터 셀 불러오기
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath) as! OrderCell
        cell.selectionStyle = .none // 클릭 시 색상 변경 x
        cell.orderTitle.text = drinks[indexPath.row].name
        cell.orderImage.image = UIImage(named: drinks[indexPath.row].name + ".png")
        cell.orderEng.text = drinks[indexPath.row].eng
        cell.orderPrice.text = drinks[indexPath.row].price
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(drinks[indexPath.row].name)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OrderDetail") as! OrderDetail
        vc.modalPresentationStyle = .fullScreen
        vc.detailmenu = drinks[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        self.delegate?.passInfo(drinks[indexPath.row])
    }
    
}
