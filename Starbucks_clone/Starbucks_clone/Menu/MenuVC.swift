//
//  MenuVC.swift
//  Starbucks_clone
//
//  Created by 김영인 on 2022/02/14.
//

import UIKit

class MenuVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var menus = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 130
        setSegmentControl()
        setInfo()
    }
    
    private func setInfo() {
        menus = ["NEW", "추천", "리저브 에스프레소","리저브 드립","블론드","에스프레소","콜드 브루"]
    }
    
    private func setSegmentControl() {
        let myMenuBar = MenuBar(frame: CGRect(x:0, y:0, width:0, height: 200), buttonTitles: ["전체메뉴","나만의 메뉴"," 홀케이크 예약"])

        self.view.addSubview(myMenuBar)
        myMenuBar.translatesAutoresizingMaskIntoConstraints = false
        myMenuBar.widthAnchor.constraint(equalToConstant: 300).isActive = true
        myMenuBar.heightAnchor.constraint(equalToConstant: 5).isActive = true
        myMenuBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
    }
}

extension MenuVC: UITableViewDataSource, UITableViewDelegate {
    // 데이터 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    // 데이터 셀 불러오기
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        cell.selectionStyle = .none // 클릭 시 색상 변경 x
        cell.menuImage.image = UIImage(named: menus[indexPath.row] + ".png")
        cell.menuTitle.text = menus[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OrderVC") as! OrderVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
