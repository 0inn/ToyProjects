//
//  ShowDetail.swift
//  Movie_demo
//
//  Created by 김영인 on 2022/02/11.
//

import UIKit
import SnapKit

class ShowDetail: UIViewController {
    
    var s_title: String?
    var s_rating: Double?
    var s_image: String?
    
    var l_title = UILabel()
    let message = UILabel()
    var l_rating = UILabel()
    var image = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    func layout() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(l_title)
        l_title.text = s_title
        l_title.font = UIFont.systemFont(ofSize: 30)
        l_title.lineBreakMode = .byWordWrapping
        l_title.numberOfLines = 0
        l_title.snp.makeConstraints() {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(100)
        }
        
        view.addSubview(message)
        message.text = "평점"
        message.snp.makeConstraints() {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalTo(l_title).inset(50)
        }
        
        view.addSubview(l_rating)
        l_rating.text = String(s_rating!)
        l_rating.snp.makeConstraints() {
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(l_title).inset(50)
        }
        
        let imageurl = URL(string: s_image!)
        let data = try! Data(contentsOf: imageurl!)
        image.image = UIImage(data: data)
        view.addSubview(image)
        image.snp.makeConstraints() {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalTo(l_rating).inset(50)
        }
        
    }
    
}

