//
//  trafik17.swift
//  Ehliyet-2017
//
//  Created by YILMAZ ER on 11.02.2018.
//  Copyright © 2018 YILMAZER. All rights reserved.
//

import UIKit

class trafik17: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var cozNO = "Çözülmedi"
    var coz = "Çözüldü"
    
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
    
    var correctOcak19 = Int()
    var incorrectOcak19 = Int()
    var puanOcak19 = String()
    var cozOcak19 = String()
    var check8 = String()
    var boOcak19 = Float()
    var boTOcak19 = String()
    
    var correctSubat19 = Int()
    var incorrectSubat19 = Int()
    var puanSubat19 = String()
    var cozSubat19 = String()
    var check9 = String()
    var boSubat19 = Float()
    var boTSubat19 = String()
    
    var correctMarch19 = Int()
    var incorrectMarch19 = Int()
    var puanMarch19 = String()
    var cozMarch19 = String()
    var check10 = String()
    var boMarch19 = Float()
    var boTMarch19 = String()
    
    @IBOutlet weak var trafik17Table: UITableView!
    
    var diagnosticArray = [Diagnostic]()
    var currentDiagnoticArray = [Diagnostic]()

    override func viewDidLoad() {
        super.viewDidLoad()

        if UserDefaults.standard.object(forKey: "vtCSubat18") != nil {
            self.correctSubat18 = UserDefaults.standard.object(forKey: "vtCSubat18") as! Int
            UserDefaults.standard.set(self.correctSubat18, forKey: "vtCSubat18")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vtISubat18") != nil {
            self.incorrectSubat18 = UserDefaults.standard.object(forKey: "vtISubat18") as! Int
            UserDefaults.standard.set(self.incorrectSubat18, forKey: "vtISubat18")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vtCozulduSubat18") != nil {
            self.cozSubat18 = UserDefaults.standard.object(forKey: "vtCozulduSubat18") as! String
            UserDefaults.standard.set(self.cozSubat18 , forKey: "vtCozulduSubat18")
            UserDefaults.standard.synchronize()
        }
        
        if UserDefaults.standard.object(forKey: "vtCNisan18") != nil {
            self.correctNisan18 = UserDefaults.standard.object(forKey: "vtCNisan18") as! Int
            UserDefaults.standard.set(self.correctNisan18, forKey: "vtCNisan18")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vtINisan18") != nil {
            self.incorrectNisan18 = UserDefaults.standard.object(forKey: "vtINisan18") as! Int
            UserDefaults.standard.set(self.incorrectNisan18, forKey: "vtINisan18")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vtCozulduNisan18") != nil {
            self.cozNisan18 = UserDefaults.standard.object(forKey: "vtCozulduNisan18") as! String
            UserDefaults.standard.set(self.cozNisan18 , forKey: "vtCozulduNisan18")
            UserDefaults.standard.synchronize()
        }
        
        if UserDefaults.standard.object(forKey: "vtCAgustos18") != nil {
            self.correctAgustos18 = UserDefaults.standard.object(forKey: "vtCAgustos18") as! Int
            UserDefaults.standard.set(self.correctAgustos18, forKey: "vtCAgustos18")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vtIAgustos18") != nil {
            self.incorrectAgustos18 = UserDefaults.standard.object(forKey: "vtIAgustos18") as! Int
            UserDefaults.standard.set(self.incorrectAgustos18, forKey: "vtIAgustos18")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vtCozulduAgustos18") != nil {
            self.cozAgustos18 = UserDefaults.standard.object(forKey: "vtCozulduAgustos18") as! String
            UserDefaults.standard.set(self.cozAgustos18 , forKey: "vtCozulduAgustos18")
            UserDefaults.standard.synchronize()
        }
        
//        Ocak 2019 Trafik ve Çevre E- Sınav Çıkmış Sorular
        
        if UserDefaults.standard.object(forKey: "vtCOcak19") != nil {
            self.correctOcak19 = UserDefaults.standard.object(forKey: "vtCOcak19") as! Int
            UserDefaults.standard.set(self.correctOcak19, forKey: "vtCOcak19")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vtIOcak19") != nil {
            self.incorrectOcak19 = UserDefaults.standard.object(forKey: "vtIOcak19") as! Int
            UserDefaults.standard.set(self.incorrectOcak19, forKey: "vtIOcak19")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vtCozulduOcak19") != nil {
            self.cozOcak19 = UserDefaults.standard.object(forKey: "vtCozulduOcak19") as! String
            UserDefaults.standard.set(self.cozOcak19 , forKey: "vtCozulduOcak19")
            UserDefaults.standard.synchronize()
        }
        
//        Şubat 2019 Trafik ve Çevre E- Sınav Çıkmış Sorular
        
        if UserDefaults.standard.object(forKey: "vtCSubat19") != nil {
            self.correctSubat19 = UserDefaults.standard.object(forKey: "vtCSubat19") as! Int
            UserDefaults.standard.set(self.correctSubat19, forKey: "vtCSubat19")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vtISubat19") != nil {
            self.incorrectSubat19 = UserDefaults.standard.object(forKey: "vtISubat19") as! Int
            UserDefaults.standard.set(self.incorrectSubat19, forKey: "vtISubat19")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vtCozulduSubat19") != nil {
            self.cozSubat19 = UserDefaults.standard.object(forKey: "vtCozulduSubat19") as! String
            UserDefaults.standard.set(self.cozSubat19 , forKey: "vtCozulduSubat19")
            UserDefaults.standard.synchronize()
        }
        
//        Mart 2019 Trafik ve Çevre E- Sınav Çıkmış Sorular
        
        if UserDefaults.standard.object(forKey: "vtCMarch19") != nil {
            self.correctMarch19 = UserDefaults.standard.object(forKey: "vtCMarch19") as! Int
            UserDefaults.standard.set(self.correctMarch19, forKey: "vtCMarch19")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vtIMarch19") != nil {
            self.incorrectMarch19 = UserDefaults.standard.object(forKey: "vtIMarch19") as! Int
            UserDefaults.standard.set(self.incorrectMarch19, forKey: "vtIMarch19")
            UserDefaults.standard.synchronize()
        }
        if UserDefaults.standard.object(forKey: "vtCozulduMarch19") != nil {
            self.cozMarch19 = UserDefaults.standard.object(forKey: "vtCozulduMarch19") as! String
            UserDefaults.standard.set(self.cozMarch19 , forKey: "vtCozulduMarch19")
            UserDefaults.standard.synchronize()
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
        
        if correctOcak19 > 0 || incorrectOcak19 > 0 {
            check8 = "check_vector1"
            cozOcak19 = coz
        } else {
            cozOcak19 = cozNO
        }
        
        if correctSubat19 > 0 || incorrectSubat19 > 0 {
            check9 = "check_vector1"
            cozSubat19 = coz
        } else {
            cozSubat19 = cozNO
        }
        
        if correctMarch19 > 0 || incorrectMarch19 > 0 {
            check10 = "check_vector1"
            cozMarch19 = coz
        } else {
            cozMarch19 = cozNO
        }
        
        puanSubat18 = String(format: "%.0f",(Float(100)/23) * Float(correctSubat18))
        puanAgustos18 = String(format: "%.0f",(Float(100)/23) * Float(correctAgustos18))
        puanOcak19 = String(format: "%.0f",(Float(100)/23) * Float(correctOcak19))
        puanSubat19 = String(format: "%.0f",(Float(100)/23) * Float(correctSubat19))
        puanMarch19 = String(format: "%.0f",(Float(100)/23) * Float(correctMarch19))
        boSubat18 = (Float(self.correctSubat18) / 23)
        boAgustos18 = (Float(self.correctAgustos18) / 23)
        boOcak19 = (Float(self.correctOcak19) / 23)
        boSubat19 = (Float(self.correctSubat19) / 23)
        boMarch19 = (Float(self.correctMarch19) / 23)
        boTSubat18 = "%" + String(format: "%.0f",(Float(self.correctSubat18) / 23) * 100)
        boTAgustos18 = "%" + String(format: "%.0f",(Float(self.correctAgustos18) / 23) * 100)
        boTOcak19 = "%" + String(format: "%.0f",(Float(self.correctOcak19) / 23) * 100)
        boTSubat19 = "%" + String(format: "%.0f",(Float(self.correctSubat19) / 23) * 100)
        boTMarch19 = "%" + String(format: "%.0f",(Float(self.correctMarch19) / 23) * 100)
        
        puanNisan18 = String(format: "%.0f",(Float(100)/23) * Float(correctNisan18))
        boNisan18 = (Float(self.correctNisan18) / 23)
        boTNisan18 = "%" + String(format: "%.0f",(Float(self.correctNisan18) / 23) * 100)
        
        setupDiagnostics()
    }
    
    private func setupDiagnostics() {
        
        diagnosticArray.append(Diagnostic(title: "Mart 2019 Trafik ve Çevre E-Sınav",image:check10, correct:String(correctMarch19), incorrect:String(incorrectMarch19),cozum:String(cozMarch19), puan: String(puanMarch19),basariOrani:boTMarch19, basariProgres:boMarch19 ))
        
        diagnosticArray.append(Diagnostic(title: "Şubat 2019 Trafik ve Çevre E-Sınav",image:check9, correct:String(correctSubat19), incorrect:String(incorrectSubat19),cozum:String(cozSubat19), puan: String(puanSubat19),basariOrani:boTSubat19, basariProgres:boSubat19 ))
        
         diagnosticArray.append(Diagnostic(title: "Ocak 2019 Trafik ve Çevre E-Sınav",image:check8, correct:String(correctOcak19), incorrect:String(incorrectOcak19),cozum:String(cozOcak19), puan: String(puanOcak19),basariOrani:boTOcak19, basariProgres:boOcak19 ))
        
        diagnosticArray.append(Diagnostic(title: "4 Ağustos 2018 Trafik ve Çevre",image:check7, correct:String(correctAgustos18), incorrect:String(incorrectAgustos18),cozum:String(cozAgustos18), puan: String(puanAgustos18),basariOrani:boTAgustos18, basariProgres:boAgustos18 ))
        
        diagnosticArray.append(Diagnostic(title: "21 Nisan 2018 Trafik ve Çevre",image:check6, correct:String(correctNisan18), incorrect:String(incorrectNisan18),cozum:String(cozNisan18), puan: String(puanNisan18),basariOrani:boTNisan18, basariProgres:boNisan18 ))
        diagnosticArray.append(Diagnostic(title: "10 Şubat 2018 Trafik ve Çevre",image:check5, correct:String(correctSubat18), incorrect:String(incorrectSubat18),cozum:String(cozSubat18), puan: String(puanSubat18),basariOrani:boTSubat18, basariProgres:boSubat18 ))

        currentDiagnoticArray = diagnosticArray
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentDiagnoticArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? trafik17Cell else {
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



