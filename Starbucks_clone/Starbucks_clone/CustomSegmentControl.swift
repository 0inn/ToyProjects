//
//  SegmentControl.swift
//  Starbucks_clone
//
//  Created by 김영인 on 2022/02/15.
//

import Foundation
import UIKit

class CustomSegmetnControl: UIView {
    private var buttonTitles: [String]!
    private var buttons: [UIButton]!
    var textColor: UIColor = .black
    
    // 기본적인 뷰 실행
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // 데이터를 뷰에 적용
    convenience init(frame: CGRect, buttonTitles: [String]) {
        self.init(frame: frame)
        self.buttonTitles = buttonTitles
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        updateView()
    }
    
    private func updateView() {
        // 버튼 만들기
        createBtn()
        // 스택 뷰 설정하기
        configStackView()
    }
    
    private func createBtn() {
        self.buttons = [UIButton]()
        // 기존 버튼 지우기
        self.buttons.removeAll()
        // 하위 뷰 지우기
        subviews.forEach({$0.removeFromSuperview()})
        for btnTitleItem in buttonTitles {
            let button = UIButton(type: .system)
            button.backgroundColor = .white
            button.setTitleColor(textColor, for: .normal)
            button.setTitle(btnTitleItem, for:.normal)
            button.addTarget(self, action: #selector(CustomSegmetnControl.buttonAction(sender:)), for: .touchUpInside)
            self.buttons.append(button)
        }
    }
    
    @objc func buttonAction(sender: UIButton) {
        for(buttonIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(.lightGray, for: .normal)
            if btn == sender {
                btn.setTitleColor(.black, for: .normal)
            }
        }
    }
    
    private func configStackView() {
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
}
