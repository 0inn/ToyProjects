//
//  OrderDetail.swift
//  Starbucks_clone
//
//  Created by 김영인 on 2022/02/16.
//

import UIKit

class OrderDetail: UIViewController {

    @IBOutlet weak var iceonly: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = true
        setDisplay()
        setFooter()
    }

    func setDisplay() {
        iceonly.layer.cornerRadius = 22.5
        iceonly.layer.borderWidth = 1
        iceonly.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func setFooter() {
        let footer = UIView(frame: CGRect(x: 0, y:0, width: view.frame.size.width, height: 80))
        footer.backgroundColor = .systemBackground
        let footerBtn = UIButton(frame: footer.bounds)
        footerBtn.setTitle("주문하기", for: .normal)
        footerBtn.setTitleColor(.white, for: .normal)
        footerBtn.backgroundColor = .green
        footerBtn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        footerBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        footerBtn.widthAnchor.cons
        footer.addSubview(footerBtn)
    }
    
}
