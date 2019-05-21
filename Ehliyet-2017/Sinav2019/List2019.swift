//
//  List2019.swift
//  Ehliyet-2017
//
//  Created by YILMAZ ER on 1/16/19.
//  Copyright © 2019 YILMAZER. All rights reserved.
//

import UIKit
import GoogleMobileAds


class List2019: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var coz:String = "Çözüldü"
    var cozNO:String = "Çözülmedi"
    
    var correctOcak19 = Int()
    var incorrectOcak19 = Int()
    var puanOcak19 = String()
    var cozOcak19 = String()
    var check = String()
    var boOcak19 = Float()
    var boTOcak19 = String()
    
    var correctSubat19 = Int()
    var incorrectSubat19 = Int()
    var puanSubat19 = String()
    var cozSubat19 = String()
    var check2 = String()
    var boSubat19 = Float()
    var boTSubat19 = String()
    
    var correctMart19 = Int()
    var incorrectMart19 = Int()
    var puanMart19 = String()
    var cozMart19 = String()
    var check3 = String()
    var boMart19 = Float()
    var boTMart19 = String()
    
    @IBOutlet weak var sinav19Table: UITableView!
    
    var diagnosticArray = [Diagnostic]()
    var currentDiagnoticArray = [Diagnostic]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Ocak 2019 Sınav Soruları
        
        if UserDefaults.standard.object(forKey: "vCOcak19") != nil {
            self.correctOcak19 = UserDefaults.standard.object(forKey: "vCOcak19") as! Int
            UserDefaults.standard.set(self.correctOcak19, forKey: "vCOcak19")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vIOcak19") != nil {
            self.incorrectOcak19 = UserDefaults.standard.object(forKey: "vIOcak19") as! Int
            UserDefaults.standard.set(self.incorrectOcak19, forKey: "vIOcak19")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vCozuldu") != nil {
            self.cozOcak19 = UserDefaults.standard.object(forKey: "vCozuldu") as! String
            UserDefaults.standard.set(self.cozOcak19, forKey: "vCozuldu")
            UserDefaults.standard.synchronize()
        }
        
//        Subat 2019 Çıkmış Sınav Soruları
        
        if UserDefaults.standard.object(forKey: "vCSubat19") != nil {
            self.correctSubat19 = UserDefaults.standard.object(forKey: "vCSubat19") as! Int
            UserDefaults.standard.set(self.correctSubat19, forKey: "vCSubat19")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vISubat19") != nil {
            self.incorrectSubat19 = UserDefaults.standard.object(forKey: "vISubat19") as! Int
            UserDefaults.standard.set(self.incorrectSubat19, forKey: "vISubat19")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vCozuldu") != nil {
            self.cozSubat19 = UserDefaults.standard.object(forKey: "vCozuldu") as! String
            UserDefaults.standard.set(self.cozSubat19, forKey: "vCozuldu")
            UserDefaults.standard.synchronize()
        }
        
//        Mart 2019 Çıkmış Sınav Soruları
        
        if UserDefaults.standard.object(forKey: "vCMart19") != nil {
            self.correctMart19 = UserDefaults.standard.object(forKey: "vCMart19") as! Int
            UserDefaults.standard.set(self.correctMart19, forKey: "vCMart19")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vIMart19") != nil {
            self.incorrectMart19 = UserDefaults.standard.object(forKey: "vIMart19") as! Int
            UserDefaults.standard.set(self.incorrectMart19, forKey: "vIMart19")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vCozuldu") != nil {
            self.cozMart19 = UserDefaults.standard.object(forKey: "vCozuldu") as! String
            UserDefaults.standard.set(self.cozMart19, forKey: "vCozuldu")
            UserDefaults.standard.synchronize()
        }
 
        
       
        if correctOcak19 > 0 || incorrectOcak19 > 0 {
            check = "check_vector1"
            cozOcak19 = coz
        } else {
            cozOcak19 = cozNO
        }
        
        if correctSubat19 > 0 || incorrectSubat19 > 0 {
            check2 = "check_vector1"
            cozSubat19 = coz
        } else {
            cozSubat19 = cozNO
        }
        
        if correctMart19 > 0 || incorrectMart19 > 0 {
            check3 = "check_vector1"
            cozMart19 = coz
        } else {
            cozMart19 = cozNO
        }
      
        
        puanOcak19 = String(format: "%.0f",(Float(100)/50) * Float(correctOcak19))
        boTOcak19 = "%" + String(format: "%.0f",(Float(self.correctOcak19) / 50) * 100)
        boOcak19 = (Float(self.correctOcak19) / 50)
        
        puanSubat19 = String(format: "%.0f",(Float(100)/50) * Float(correctSubat19))
        boTSubat19 = "%" + String(format: "%.0f",(Float(self.correctSubat19) / 50) * 100)
        boSubat19 = (Float(self.correctSubat19) / 50)
        
        puanMart19 = String(format: "%.0f",(Float(100)/50) * Float(correctMart19))
        boTMart19 = "%" + String(format: "%.0f",(Float(self.correctMart19) / 50) * 100)
        boMart19 = (Float(self.correctMart19) / 50)
        
        
        setupDiagnostics()
        
    }
    
    private func setupDiagnostics() {
        
         diagnosticArray.append(Diagnostic(title: "Mart 2019 E-Sınav",image:check3, correct:String(correctMart19), incorrect:String(incorrectMart19),cozum:String(cozMart19), puan: String(puanMart19),basariOrani:boTMart19, basariProgres:boMart19 ))
        
        diagnosticArray.append(Diagnostic(title: "Şubat 2019 E-Sınav",image:check2, correct:String(correctSubat19), incorrect:String(incorrectSubat19),cozum:String(cozSubat19), puan: String(puanSubat19),basariOrani:boTSubat19, basariProgres:boSubat19 ))
        
        diagnosticArray.append(Diagnostic(title: "Ocak 2019 E-Sınav",image:check, correct:String(correctOcak19), incorrect:String(incorrectOcak19),cozum:String(cozOcak19), puan: String(puanOcak19),basariOrani:boTOcak19, basariProgres:boOcak19 ))
        
    
        
        currentDiagnoticArray = diagnosticArray
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentDiagnoticArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? Ocak19Cell else {
            return UITableViewCell()
        }
        
        cell.mTitle.text = currentDiagnoticArray[indexPath.row].title
        cell.mCheck.image = UIImage(named:currentDiagnoticArray[indexPath.row].image)
        cell.Correct.text = currentDiagnoticArray[indexPath.row].correct
        cell.inCorrect.text = currentDiagnoticArray[indexPath.row].incorrect
        cell.cozum.text = currentDiagnoticArray[indexPath.row].cozum
        cell.puanS.text = currentDiagnoticArray[indexPath.row].puan
        cell.basariOrani.text = currentDiagnoticArray[indexPath.row].basariOrani
        cell.basariProgress.value = currentDiagnoticArray[indexPath.row].basariProgres
        if cell.cozum.text == cozNO {
            cell.cozum.textColor = UIColor.red
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vcName = currentDiagnoticArray[indexPath.row].title
        let viewController = storyboard?.instantiateViewController(withIdentifier: vcName)
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
    
    
    class Diagnostic {
        
        let title:String
        let image:String
        var correct:String
        var incorrect:String
        var cozum:String
        var puan:String
        var basariOrani:String
        var basariProgres:Float
        
        init(title: String,image: String, correct:String, incorrect:String, cozum:String, puan:String, basariOrani:String, basariProgres:Float) {
            self.title = title
            self.image = image
            self.correct = correct
            self.incorrect = incorrect
            self.cozum = cozum
            self.puan = puan
            self.basariOrani = basariOrani
            self.basariProgres = basariProgres
        }
        
    }
}





