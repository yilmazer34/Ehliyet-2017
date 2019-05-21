//
//  KisaNotlarCell.swift
//  Ehliyet
//
//  Created by YILMAZ ER on 20.12.2017.
//  Copyright © 2017 YILMAZ ER. All rights reserved.
//

import UIKit

class KisaNotlarCell: UITableViewCell {
    
    @IBOutlet weak var imageDesen: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var Cname: UILabel!
    @IBOutlet weak var imgNext: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
