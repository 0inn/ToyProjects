//
//  MenuCell.swift
//  Starbucks_clone
//
//  Created by 김영인 on 2022/02/15.
//

import Foundation
import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var menuTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
    }
}
