//
//  SelectVC.swift
//  Starbucks_clone
//
//  Created by 김영인 on 2022/02/16.
//

import UIKit

class SelectVC: UIViewController {

    var info: Menu?
    
    @IBOutlet weak var drinkLabel: UILabel!
    @IBOutlet weak var cntLabel: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var cart: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var minus: UIButton!
    
    @IBAction func cntplus(_ sender: Any) {
        cntLabel.text = String(Int(cntLabel.text!)! + 1)
        price.text = String(Int(price.text!)! * 2)
        btncolor()
    }
    
    @IBAction func cntminus(_ sender: Any) {
        if (cntLabel.text!) == "1" {
            cntLabel.text = "1"
        } else {
            cntLabel.text = String(Int(cntLabel.text!)! - 1)
            price.text = String(Int(price.text!)! / 2)
        }
        btncolor()
    }
    
    @IBAction func addCart(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CartAlertVC") as! CartAlertVC
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc,animated: false)
    }

    private func btncolor() {
        if (cntLabel.text!) == "1" {
            minus.tintColor = .lightGray
        }
        else {
            minus.tintColor = .darkGray
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drinkLabel.text = info?.name
        price.text = info?.price
    }

}
