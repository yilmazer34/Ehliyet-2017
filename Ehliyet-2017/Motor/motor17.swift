//
//  motor17.swift
//  Ehliyet-2017
//
//  Created by YILMAZ ER on 13.02.2018.
//  Copyright © 2018 YILMAZER. All rights reserved.
//

import UIKit

class motor17: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var coz:String = "Çözüldü"
    var cozNO:String = "Çözülmedi"
    
    var correctAralik17 = Int()
    var incorrectAralik17 = Int()
    var puanAralik17 = String()
    var cozAralik17 = String()
    var check = String()
    var boAralik17 = Float()
    var boTAralik17 = String()
    
    var correctEkim17 = Int()
    var incorrectEkim17 = Int()
    var puanEkim17 = String()
    var cozEkim17 = String()
    var check1 = String()
    var boEkim17 = Float()
    var boTEkim17 = String()
    
    var correctTemmuz17 = Int()
    var incorrectTemmuz17 = Int()
    var puanTemmuz17 = String()
    var cozTemmuz17 = String()
    var check2 = String()
    var boTemmuz17 = Float()
    var boTTemmuz17 = String()
    
    var correctMayis17 = Int()
    var incorrectMayis17 = Int()
    var puanMayis17 = String()
    var cozMayis17 = String()
    var check3 = String()
    var boMayis17 = Float()
    var boTMayis17 = String()
    
    var correctSubat17 = Int()
    var incorrectSubat17 = Int()
    var puanSubat17 = String()
    var cozSubat17 = String()
    var check4 = String()
    var boSubat17 = Float()
    var boTSubat17 = String()
    
    var correctSubat18 = Int()
    var incorrectSubat18 = Int()
    var puanSubat18 = String()
    var cozSubat18 = String()
    var check5 = String()
    var boSubat18 = Float()
    var boTSubat18 = String()
    
    var correctNisan18 = Int()
    var incorrectNisan18 = Int()
    var puanNisan18 = String()
    var cozNisan18 = String()
    var check6 = String()
    var boNisan18 = Float()
    var boTNisan18 = String()
    
    var correctAgustos18 = Int()
    var incorrectAgustos18 = Int()
    var puanAgustos18 = String()
    var cozAgustos18 = String()
    var check7 = String()
    var boAgustos18 = Float()
    var boTAgustos18 = String()
    
    @IBOutlet weak var trafik17Table: UITableView!
    
    var diagnosticArray = [Diagnostic]()
    var currentDiagnoticArray = [Diagnostic]()

    override func viewDidLoad() {
        super.viewDidLoad()

        if UserDefaults.standard.object(forKey: "vmCAralik17") != nil {
            self.correctAralik17 = UserDefaults.standard.object(forKey: "vmCAralik17") as! Int
            UserDefaults.standard.set(self.correctAralik17, forKey: "vmCAralik17")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vmIAralik17") != nil {
            self.incorrectAralik17 = UserDefaults.standard.object(forKey: "vmIAralik17") as! Int
            UserDefaults.standard.set(self.incorrectAralik17, forKey: "vmIAralik17")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vmCozuldu") != nil {
            self.cozAralik17 = UserDefaults.standard.object(forKey: "vmCozuldu") as! String
            UserDefaults.standard.set(self.cozAralik17, forKey: "vmCozuldu")
            UserDefaults.standard.synchronize()
        }
        
        
        if UserDefaults.standard.object(forKey: "vmCEkim17") != nil {
            self.correctEkim17 = UserDefaults.standard.object(forKey: "vmCEkim17") as! Int
            UserDefaults.standard.set(self.correctEkim17, forKey: "vmCEkim17")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vmIEkim17") != nil {
            self.incorrectEkim17 = UserDefaults.standard.object(forKey: "vmIEkim17") as! Int
            UserDefaults.standard.set(self.incorrectEkim17, forKey: "vmIEkim17")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vmCozulduEkim17") != nil {
            self.cozEkim17 = UserDefaults.standard.object(forKey: "vmCozulduEkim17") as! String
            UserDefaults.standard.set(self.cozEkim17, forKey: "vmCozulduEkim17")
            UserDefaults.standard.synchronize()
        }
        
        if UserDefaults.standard.object(forKey: "vmCTemmuz17") != nil {
            self.correctTemmuz17 = UserDefaults.standard.object(forKey: "vmCTemmuz17") as! Int
            UserDefaults.standard.set(self.correctTemmuz17, forKey: "vmCTemmuz17")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vmITemmuz17") != nil {
            self.incorrectTemmuz17 = UserDefaults.standard.object(forKey: "vmITemmuz17") as! Int
            UserDefaults.standard.set(self.incorrectTemmuz17, forKey: "vmITemmuz17")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vmCozulduTemmuz17") != nil {
            self.cozTemmuz17 = UserDefaults.standard.object(forKey: "vmCozulduTemmuz17") as! String
            UserDefaults.standard.set(self.cozTemmuz17, forKey: "vmCozulduTemmuz17")
            UserDefaults.standard.synchronize()
        }
        
        if UserDefaults.standard.object(forKey: "vmCMayis17") != nil {
            self.correctMayis17 = UserDefaults.standard.object(forKey: "vmCMayis17") as! Int
            UserDefaults.standard.set(self.correctMayis17, forKey: "vmCMayis17")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vmIMayis17") != nil {
            self.incorrectMayis17 = UserDefaults.standard.object(forKey: "vmIMayis17") as! Int
            UserDefaults.standard.set(self.incorrectMayis17, forKey: "vmIMayis17")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vmCozulduMayis17") != nil {
            self.cozMayis17 = UserDefaults.standard.object(forKey: "vmCozulduMayis17") as! String
            UserDefaults.standard.set(self.cozMayis17, forKey: "vmCozulduMayis17")
            UserDefaults.standard.synchronize()
        }
        
        if UserDefaults.standard.object(forKey: "vmCSubat17") != nil {
            self.correctSubat17 = UserDefaults.standard.object(forKey: "vmCSubat17") as! Int
            UserDefaults.standard.set(self.correctSubat17, forKey: "vmCSubat17")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vmISubat17") != nil {
            self.incorrectSubat17 = UserDefaults.standard.object(forKey: "vmISubat17") as! Int
            UserDefaults.standard.set(self.incorrectSubat17, forKey: "vmISubat17")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vmCozulduSubat17") != nil {
            self.cozSubat17 = UserDefaults.standard.object(forKey: "vmCozulduSubat17") as! String
            UserDefaults.standard.set(self.cozSubat17 , forKey: "vmCozulduSubat17")
            UserDefaults.standard.synchronize()
        }
        
        if UserDefaults.standard.object(forKey: "vmCSubat18") != nil {
            self.correctSubat18 = UserDefaults.standard.object(forKey: "vmCSubat18") as! Int
            UserDefaults.standard.set(self.correctSubat18, forKey: "vmCSubat18")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vmISubat18") != nil {
            self.incorrectSubat18 = UserDefaults.standard.object(forKey: "vmISubat18") as! Int
            UserDefaults.standard.set(self.incorrectSubat18, forKey: "vmISubat18")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vmCozulduSubat18") != nil {
            self.cozSubat18 = UserDefaults.standard.object(forKey: "vmCozulduSubat18") as! String
            UserDefaults.standard.set(self.cozSubat18 , forKey: "vmCozulduSubat18")
            UserDefaults.standard.synchronize()
        }
        
        if UserDefaults.standard.object(forKey: "vmCNisan18") != nil {
            self.correctNisan18 = UserDefaults.standard.object(forKey: "vmCNisan18") as! Int
            UserDefaults.standard.set(self.correctNisan18, forKey: "vmCNisan18")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vmINisan18") != nil {
            self.incorrectNisan18 = UserDefaults.standard.object(forKey: "vmINisan18") as! Int
            UserDefaults.standard.set(self.incorrectNisan18, forKey: "vmINisan18")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vmCozulduNisan18") != nil {
            self.cozNisan18 = UserDefaults.standard.object(forKey: "vmCozulduNisan18") as! String
            UserDefaults.standard.set(self.cozNisan18 , forKey: "vmCozulduNisan18")
            UserDefaults.standard.synchronize()
        }
        
        if UserDefaults.standard.object(forKey: "vmCAgustos18") != nil {
            self.correctAgustos18 = UserDefaults.standard.object(forKey: "vmCAgustos18") as! Int
            UserDefaults.standard.set(self.correctAgustos18, forKey: "vmCAgustos18")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vmIAgustos18") != nil {
            self.incorrectAgustos18 = UserDefaults.standard.object(forKey: "vmIAgustos18") as! Int
            UserDefaults.standard.set(self.incorrectAgustos18, forKey: "vmIAgustos18")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vmCozulduAgustos18") != nil {
            self.cozAgustos18 = UserDefaults.standard.object(forKey: "vmCozulduAgustos18") as! String
            UserDefaults.standard.set(self.cozAgustos18 , forKey: "vmCozulduAgustos18")
            UserDefaults.standard.synchronize()
        }
        
        if correctAralik17 > 0 || incorrectAralik17 > 0 {
            check = "check_vector1"
            cozAralik17 = coz
        } else {
            cozAralik17 = cozNO
        }
        
        if correctEkim17 > 0 || incorrectEkim17 > 0 {
            check1 = "check_vector1"
            cozEkim17 = coz
        } else {
            cozEkim17 = cozNO
        }
        
        if correctTemmuz17 > 0 || incorrectTemmuz17 > 0 {
            check2 = "check_vector1"
            cozTemmuz17 = coz
        } else {
            cozTemmuz17 = cozNO
        }
        
        if correctMayis17 > 0 || incorrectMayis17 > 0 {
            check3 = "check_vector1"
            cozMayis17 = coz
        } else {
            cozMayis17 = cozNO
        }
        
        if correctSubat17 > 0 || incorrectSubat17 > 0 {
            check4 = "check_vector1"
            cozSubat17 = coz
        } else {
            cozSubat17 = cozNO
        }
        
        if correctSubat18 > 0 || incorrectSubat18 > 0 {
            check5 = "check_vector1"
            cozSubat18 = coz
        } else {
            cozSubat18 = cozNO
        }
        
        if correctNisan18 > 0 || incorrectNisan18 > 0 {
            check6 = "check_vector1"
            cozNisan18 = coz
        } else {
            cozNisan18 = cozNO
        }
        
        if correctAgustos18 > 0 || incorrectAgustos18 > 0 {
            check7 = "check_vector1"
            cozAgustos18 = coz
        } else {
            cozAgustos18 = cozNO
        }
        
        puanSubat18 = String(format: "%.0f",(Float(100)/9) * Float(correctSubat18))
        puanAralik17 = String(format: "%.0f",(Float(100)/9) * Float(correctAralik17))
        puanEkim17 = String(format: "%.0f",(Float(100)/9) * Float(correctEkim17))
        puanTemmuz17 = String(format: "%.0f",(Float(100)/9) * Float(correctTemmuz17))
        puanMayis17 = String(format: "%.0f",(Float(100)/9) * Float(correctMayis17))
        puanSubat17 = String(format: "%.0f",(Float(100)/9) * Float(correctSubat17))
        puanAgustos18 = String(format: "%.0f",(Float(100)/9) * Float(correctAgustos18))
        boSubat18 = (Float(self.correctSubat18) / 9)
        boAralik17 = (Float(self.correctAralik17) / 9)
        boEkim17 = (Float(self.correctEkim17) / 9)
        boTemmuz17 = (Float(self.correctTemmuz17) / 9)
        boMayis17 = (Float(self.correctMayis17) / 9)
        boSubat17 = (Float(self.correctSubat17) / 9)
        boAgustos18 = (Float(self.correctAgustos18) / 9)
        boTSubat18 = "%" + String(format: "%.0f",(Float(self.correctSubat18) / 9) * 100)
        boTAralik17 = "%" + String(format: "%.0f",(Float(self.correctAralik17) / 9) * 100)
        boTEkim17 = "%" + String(format: "%.0f",(Float(self.correctEkim17) / 9) * 100)
        boTTemmuz17 = "%" + String(format: "%.0f",(Float(self.correctTemmuz17) / 9) * 100)
        boTMayis17 = "%" + String(format: "%.0f",(Float(self.correctMayis17) / 9) * 100)
        boTSubat17 = "%" + String(format: "%.0f",(Float(self.correctSubat17) / 9) * 100)
        boTAgustos18 = "%" + String(format: "%.0f",(Float(self.correctAgustos18) / 9) * 100)
        
        puanNisan18 = String(format: "%.0f",(Float(100)/9) * Float(correctNisan18))
        boNisan18 = (Float(self.correctNisan18) / 9)
        boTNisan18 = "%" + String(format: "%.0f",(Float(self.correctNisan18) / 9) * 100)
        
        setupDiagnostics()
    }
    
    private func setupDiagnostics() {
        diagnosticArray.append(Diagnostic(title: "4 Ağustos 2018 Motor",image:check7, correct:String(correctAgustos18), incorrect:String(incorrectAgustos18),cozum:String(cozAgustos18), puan: String(puanAgustos18),basariOrani:boTAgustos18, basariProgres:boAgustos18 ))
        diagnosticArray.append(Diagnostic(title: "21 Nisan 2018 Motor",image:check6, correct:String(correctNisan18), incorrect:String(incorrectNisan18),cozum:String(cozNisan18), puan: String(puanNisan18),basariOrani:boTNisan18, basariProgres:boNisan18 ))
        diagnosticArray.append(Diagnostic(title: "10 Şubat 2018 Motor",image:check5, correct:String(correctSubat18), incorrect:String(incorrectSubat18),cozum:String(cozSubat18), puan: String(puanSubat18),basariOrani:boTSubat18, basariProgres:boSubat18 ))
        diagnosticArray.append(Diagnostic(title: "23 Aralık 2017 Motor",image:check, correct:String(correctAralik17), incorrect:String(incorrectAralik17),cozum:String(cozAralik17), puan: String(puanAralik17),basariOrani:boTAralik17, basariProgres:boAralik17 ))
        diagnosticArray.append(Diagnostic(title: "7 Ekim 2017 Motor",image:check1, correct:String(correctEkim17), incorrect:String(incorrectEkim17),cozum:String(cozEkim17), puan: String(puanEkim17),basariOrani:boTEkim17, basariProgres:boEkim17 ))
        diagnosticArray.append(Diagnostic(title: "29 Temmuz 2017 Motor",image:check2, correct:String(correctTemmuz17), incorrect:String(incorrectTemmuz17),cozum:String(cozTemmuz17), puan: String(puanTemmuz17),basariOrani:boTTemmuz17, basariProgres:boTemmuz17 ))
        diagnosticArray.append(Diagnostic(title: "20 Mayıs 2017 Motor",image:check3, correct:String(correctMayis17), incorrect:String(incorrectMayis17),cozum:String(cozMayis17), puan: String(puanMayis17),basariOrani:boTMayis17, basariProgres:boMayis17 ))
        diagnosticArray.append(Diagnostic(title: "11 Şubat 2017 Motor",image:check4, correct:String(correctSubat17), incorrect:String(incorrectSubat17),cozum:String(cozSubat17), puan: String(puanSubat17),basariOrani:boTSubat17, basariProgres:boSubat17 ))
        
        currentDiagnoticArray = diagnosticArray
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentDiagnoticArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? motor17Cell else {
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
        } else {
            cell.cozum.textColor = UIColor(red: 0, green: 0.5373, blue: 0.0784, alpha: 1.0)
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



