//
//  sinavyilsecimi.swift
//  Ehliyet-2017
//
//  Created by YILMAZ ER on 15.02.2018.
//  Copyright © 2018 YILMAZER. All rights reserved.
//

import UIKit

class sinavyilsecimi: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var x:Int = 0
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var gitBtn: RoundButton!
    
    let animals = ["2019","2018","2017","2016","2015"]
    
    override func viewDidLoad() {
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        super.viewDidLoad()

        pickerView.isMultipleTouchEnabled = false
        // Do any additional setup after loading the view.
    }
    

    @IBAction func git(_ sender: Any) {
        
        switch pickerView.selectedRow(inComponent: x) {
            
        case 0:
            self.performSegue(withIdentifier: "g19", sender: self)
            print("index 0")
            break
        case 1:
            self.performSegue(withIdentifier: "g18", sender: self)
            print("index 1")
            break
        case 2:
            self.performSegue(withIdentifier: "g17", sender: self)
            print("index 2")
            break
        case 3:
            self.performSegue(withIdentifier: "g16", sender: self)
            print("index 3")
            break
        case 4:
            self.performSegue(withIdentifier: "g15", sender: self)
            print("index 4")
            break
        default:
            break
        }
        
    }
    
    func gittikla(){
        let alertController = UIAlertController(title: "MERHABA", message: "\n\nLütfen Yıllardan birini şeçiniz.", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "TAMAM", style: UIAlertAction.Style.default, handler: {(action) -> Void in
            
        })
        
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return animals.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return animals[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        gitBtn.setTitle(animals[row], for: .normal)
        
      /*  let vcName = animals[row]
        let viewController = storyboard?.instantiateViewController(withIdentifier: vcName)
        self.navigationController?.pushViewController(viewController!, animated: true) */
        
    }
}
