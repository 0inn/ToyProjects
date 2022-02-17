//
//  TabBarController.swift
//  Starbucks_clone
//
//  Created by 김영인 on 2022/02/16.
//

import UIKit

class TabBarController: UITabBarController{

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    // viewDidApper : 뷰가 나타났을 때, 실행
    override func viewDidAppear(_ animated: Bool) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "AdVC") else { return }
        vc.modalPresentationStyle = .overFullScreen // full screen은 왜 안됨 ?
        self.present(vc,animated: false, completion: nil)
        
    }

}
