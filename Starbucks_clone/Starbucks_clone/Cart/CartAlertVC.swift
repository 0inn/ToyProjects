//
//  CartAlertViewController.swift
//  Starbucks_clone
//
//  Created by 김영인 on 2022/02/17.
//

import UIKit

class CartAlertVC: UIViewController {

    @IBAction func closeBtn(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func goCart(_ sender: Any) {
        let cart = self.storyboard?.instantiateViewController(withIdentifier: "CartVC") as! CartVC
        cart.modalPresentationStyle = .overFullScreen
        self.present(cart,animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.4)
        view.isOpaque = false
    }
}
