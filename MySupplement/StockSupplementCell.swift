//
//  TableViewCell.swift
//  MySupplement
//
//  Created by 濱山知香 on 2019/06/27.
//  Copyright © 2019 濱山知香. All rights reserved.
//

import UIKit

class StockSupplementCell: UITableViewCell {

    @IBOutlet weak var supplementThumdnail: UIImageView!
    @IBOutlet weak var supplementName: UILabel!
    @IBOutlet weak var suppulementStockTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
