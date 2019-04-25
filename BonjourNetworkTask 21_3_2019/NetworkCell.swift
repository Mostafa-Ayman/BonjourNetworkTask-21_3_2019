//
//  NetworkCell.swift
//  Bonjour
//
//  Created by SAM on 3/21/19.
//  Copyright © 2019 com.connectus. All rights reserved.
//

import UIKit

class NetworkCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelStatus: UILabel!
    @IBOutlet weak var buttonAlert: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
