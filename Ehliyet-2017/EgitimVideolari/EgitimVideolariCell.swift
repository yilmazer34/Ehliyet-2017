//
//  EgitimVideolariCell.swift
//  Ehliyet-2017
//
//  Created by YILMAZ ER on 8.03.2018.
//  Copyright © 2018 YILMAZER. All rights reserved.
//

import UIKit

class EgitimVideolariCell: UITableViewCell {
    
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
