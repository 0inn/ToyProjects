//
//  OrderDetail.swift
//  Starbucks_clone
//
//  Created by 김영인 on 2022/02/16.
//

import UIKit

class OrderDetail: UIViewController {

    @IBOutlet weak var iceonly: UILabel!
    @IBOutlet weak var footer: UIView!
    @IBOutlet weak var footerBtn: UIButton!
    @IBOutlet weak var ingView: UIView!
    
    var detailmenu: Menu?
    
    // 정보 받아올 애들
    @IBOutlet weak var odtitle: UILabel!
    @IBOutlet weak var odeng: UILabel!
    @IBOutlet weak var odprice: UILabel!
    @IBOutlet weak var detailImg: UIImageView!
    
    @IBAction func orderBtn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SelectVC") as! SelectVC
        self.present(vc,animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        self.title = detailmenu?.name
        //self.navigationController?.isNavigationBarHidden = true
        setDisplay()
    }

    func setDisplay() {
        odtitle.text = detailmenu?.name
        odeng.text = detailmenu?.eng
        odprice.text = detailmenu?.price
        detailImg.image = UIImage(named: (detailmenu?.name)! + "d.png")
        
        iceonly.layer.cornerRadius = 22.5
        iceonly.layer.borderWidth = 1
        iceonly.layer.borderColor = UIColor.lightGray.cgColor
        ingView.layer.borderWidth = 1
        ingView.layer.borderColor = UIColor.systemFill.cgColor
    }
    
}

extension OrderDetail: OrderDelgate {
    func passInfo(_ infos: Menu) {
        self.odtitle?.text = infos.name
        self.odeng.text = infos.eng
        self.odprice.text = infos.price
        self.detailImg.image = UIImage(named: infos.name + "d.png")
    }
    
}
