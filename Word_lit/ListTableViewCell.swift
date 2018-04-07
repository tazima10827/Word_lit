//
//  ListTableViewCell.swift
//  Word_lit
//
//  Created by 田嶋智洋 on 2018/04/07.
//  Copyright © 2018年 田嶋智洋. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var englishLabel: UILabel!
    @IBOutlet weak var japaneseLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
