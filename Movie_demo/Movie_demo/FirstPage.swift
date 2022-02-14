//
//  FirstPage.swift
//  Movie_demo
//
//  Created by 김영인 on 2022/02/10.
//

import UIKit
import SnapKit

class FirstPage: UIViewController {
    
    let msg = UILabel()
    let field = UITextField()
    let btn = UIButton()
    let nxtbtn = UIButton()
    var picker = UIPickerView()
    var list = ["0","1","2","3","4","5","6","7","8","9"]
    var isCalling = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Movie"
        setDisplay()
        //setPicker()
    }
    
    private func setDisplay() {
        msg.text = "최소 평점을 입력하세요 (0~9)"
        view.addSubview(msg)
        msg.snp.makeConstraints{
            $0.top.equalToSuperview().inset(100)
            $0.leading.equalToSuperview().inset(20)
        }
        
        field.placeholder = "(0~9)"
        field.borderStyle = .roundedRect
        view.addSubview(field)
        //field.inputView = mypicker
        field.snp.makeConstraints{
            $0.top.equalTo(msg).inset(30)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(350)
        }
        
        btn.setTitle("다음", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 10
        // btn 그림자 관련
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOpacity = 1.5
        btn.layer.shadowOffset = CGSize(width: 0, height: 4)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(moveVC), for: .touchUpInside)
        view.addSubview(btn)
        btn.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(50)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(350)
        }
        
        nxtbtn.setTitle("next", for: .normal)
        nxtbtn.setTitleColor(.systemBlue, for: .normal)
        nxtbtn.translatesAutoresizingMaskIntoConstraints = false
        nxtbtn.addTarget(self, action: #selector(moveVC), for: .touchUpInside)
        let item = UIBarButtonItem(customView: nxtbtn)
        self.navigationItem.setRightBarButton(item, animated: false)
    }
    
    @objc private func moveVC() {
        let newVC = MovieVC()
        let minrate  = Int(field.text!) ?? 0
        newVC.minRate = minrate
        self.navigationController?.pushViewController(newVC, animated: false)
    }

}

extension FirstPage: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func setPicker() {
        view.addSubview(picker)
        picker.delegate = self
        picker.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return list.count
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return list[row]
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            print("select=\(row)")
        }
}
