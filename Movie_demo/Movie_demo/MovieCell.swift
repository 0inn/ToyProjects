//
//  MovieCell.swift
//  Movie_demo
//
//  Created by 김영인 on 2022/02/10.
//

import UIKit

class MovieCell: UITableViewCell {
    
    let title = UILabel()
    let rating = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        self.addSubview(title)
        title.snp.makeConstraints() {
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(50)
            $0.height.equalToSuperview()
        }
        self.addSubview(rating)
        rating.snp.makeConstraints() {
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalToSuperview()
        }
    }
    
}

