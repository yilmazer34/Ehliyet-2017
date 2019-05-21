//
//  info.swift
//  Ehliyet-2017
//
//  Created by YILMAZ ER on 3.11.2018.
//  Copyright © 2018 YILMAZER. All rights reserved.
//

import UIKit
import Foundation
import MessageUI

class info: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func website(_ sender: Any) {
        
        UIApplication.shared.open(URL(string: "https://developeryilmazer.azurewebsites.net")! as URL, options: [:], completionHandler: nil)
        
    }
    
    
}

