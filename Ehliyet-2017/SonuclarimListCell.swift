//
//  SonuclarimListCell.swift
//  Ehliyet-Kazanin
//
//  Created by YILMAZ ER on 12.04.2018.
//  Copyright © 2018 YILMAZ ER. All rights reserved.
//

import UIKit

class SoncularimListCell: UITableViewCell {

    @IBOutlet weak var dersAdi: UILabel!
    @IBOutlet weak var dogruS: UILabel!
    @IBOutlet weak var yanlisS: UILabel!
    @IBOutlet weak var puanS: UILabel!
    @IBOutlet weak var tarihS: UILabel!
    @IBOutlet weak var saatS: UILabel!
    @IBOutlet weak var basariOrani: UILabel!
    @IBOutlet weak var basariProgress: CirclePath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
