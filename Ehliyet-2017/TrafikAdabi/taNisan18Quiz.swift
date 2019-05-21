//
//  taNisan18Quiz.swift
//  Ehliyet-2017
//
//  Created by YILMAZ ER on 26.04.2018.
//  Copyright © 2018 YILMAZER. All rights reserved.
//

import UIKit
import GoogleMobileAds

import CoreData

class taNisan18Quiz: UIViewController , GADInterstitialDelegate   {
    
    var fullScreenads :GADInterstitial!
    
    let allQuestions = taNisan18Bank()
    var questionNumber: Int = 0
    var correct: Int = 0
    var incorrect: Int = 0
    var selectedAnswer: Int = 0
    var score007: Int = 0
    @IBOutlet weak var progresView: RoundButton!
    @IBOutlet weak var viewProgress: RoundButton!
    @IBOutlet weak var qNoText: UILabel!
    @IBOutlet weak var wrongText: UILabel!
    @IBOutlet weak var correctText: UILabel!
    @IBOutlet weak var answerText: UILabel!
    @IBOutlet weak var qImage: UIImageView!
    @IBOutlet weak var optionA: RoundButton!
    @IBOutlet weak var optionB: RoundButton!
    @IBOutlet weak var optionC: RoundButton!
    @IBOutlet weak var optionD: RoundButton!
    @IBOutlet weak var nexttBtn: RoundButton!
    
    let defaults = UserDefaults.standard
    
    var Nisan18 = ["null", "null","null","null","null","null","null"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(score007)")
        
        if UserDefaults.standard.object(forKey: "val007") != nil {
            self.score007 = UserDefaults.standard.object(forKey: "val007") as! Int
        }
        
        if score007 < 1 {
            alertreklamtikla()
        }
        
        
        
        title = "Trafik Adabı (21 Nisan 2018)"
        
        if defaults.object(forKey: "Nisan18") != nil {
            self.Nisan18 = defaults.object(forKey: "Nisan18") as! [String]
            UserDefaults.standard.synchronize()
        }
        
        if defaults.object(forKey: "vaCNisan18") != nil {
            self.correct = defaults.object(forKey: "vaCNisan18") as! Int
            UserDefaults.standard.synchronize()
        }
        
        if defaults.object(forKey: "vaINisan18") != nil {
            self.incorrect = defaults.object(forKey: "vaINisan18") as! Int
            UserDefaults.standard.synchronize()
        }
        
        correctText.text = "Doğru: \(correct)"
        wrongText.text = "Yanlış: \(incorrect)"
        
        updataUI()
        updateQuestion()
        StartSave()
    }
    
    @IBAction func finishQuiz(_ sender: Any) {
        alert()
    }
    
    func updateQuestion(){
        if  questionNumber <= allQuestions.list.count - 1 && questionNumber > -1 {
            qImage.image = UIImage(named: (allQuestions.list[questionNumber].questionImage))
            optionA.setTitle(allQuestions.list[questionNumber].optionA, for: UIControl.State.normal)
            optionB.setTitle(allQuestions.list[questionNumber].optionB, for: UIControl.State.normal)
            optionC.setTitle(allQuestions.list[questionNumber].optionC, for: UIControl.State.normal)
            optionD.setTitle(allQuestions.list[questionNumber].optionD, for: UIControl.State.normal)
            optionA.backgroundColor = UIColor.white
            optionB.backgroundColor = UIColor.white
            optionC.backgroundColor = UIColor.white
            optionD.backgroundColor = UIColor.white
            selectedAnswer = allQuestions.list[questionNumber].correctAnswer
        } else {
            alert()
        }
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        
        //        hav not SAVE .........................................................................
        if Nisan18[questionNumber] == "null" {
            
            if sender.tag == selectedAnswer {
               
                print("correct")
                sender.backgroundColor = UIColor.green
                correct += 1
                correctText.text = "Doğru: \(correct)"
                if sender.tag == 1 {
                    Nisan18[questionNumber] = "1"
                    defaults.set(Nisan18, forKey: "Nisan18")
                }
                if sender.tag == 2 {
                    Nisan18[questionNumber] = "2"
                    defaults.set(Nisan18, forKey: "Nisan18")
                }
                if sender.tag == 3 {
                    Nisan18[questionNumber] = "3"
                    defaults.set(Nisan18, forKey: "Nisan18")
                }
                if sender.tag == 4 {
                    Nisan18[questionNumber] = "4"
                    defaults.set(Nisan18, forKey: "Nisan18")
                }
            } else {
                print("wrong")
            
                sender.backgroundColor = UIColor.red
                incorrect += 1
                wrongText.text = "Yanlış: \(incorrect)"
                if sender.tag == 1 {
                    Nisan18[questionNumber] = "1"
                    defaults.set(Nisan18, forKey: "Nisan18")
                    
                }
                if sender.tag == 2 {
                    Nisan18[questionNumber] = "2"
                    defaults.set(Nisan18, forKey: "Nisan18")
                    
                }
                if sender.tag == 3 {
                    Nisan18[questionNumber] = "3"
                    defaults.set(Nisan18, forKey: "Nisan18")
                    
                }
                if sender.tag == 4 {
                    Nisan18[questionNumber] = "4"
                    defaults.set(Nisan18, forKey: "Nisan18")
                    
                }
                greatBtn()
            }
            //            hav SAVE .....................................................................
        } else {
            
            if Nisan18[questionNumber] != String(selectedAnswer) {
                if sender.tag == selectedAnswer {
                    print("correct")
                 
                    sender.backgroundColor = UIColor.green
                    correct += 1
                    incorrect -= 1
                    correctText.text = "Doğru: \(correct)"
                    wrongText.text = "Yanlış: \(incorrect)"
                    if sender.tag == 1 {
                        Nisan18[questionNumber] = "1"
                        defaults.set(Nisan18, forKey: "Nisan18")
                        defaults.synchronize()
                    }
                    if sender.tag == 2 {
                        Nisan18[questionNumber] = "2"
                        defaults.set(Nisan18, forKey: "Nisan18")
                        defaults.synchronize()
                    }
                    if sender.tag == 3 {
                        Nisan18[questionNumber] = "3"
                        defaults.set(Nisan18, forKey: "Nisan18")
                        defaults.synchronize()
                    }
                    if sender.tag == 4 {
                        Nisan18[questionNumber] = "4"
                        defaults.set(Nisan18, forKey: "Nisan18")
                        defaults.synchronize()
                    }
                    sender.backgroundColor = UIColor.green
                    wrongText.text = "Yanlış: \(incorrect)"
                    correctText.text = "Doğru: \(correct)"
                    
                } else {
                    if sender.tag == 1 {
                        Nisan18[questionNumber] = "1"
                        defaults.set(Nisan18, forKey: "Nisan18")
                        defaults.synchronize()
                    }
                    if sender.tag == 2 {
                        Nisan18[questionNumber] = "2"
                        defaults.set(Nisan18, forKey: "Nisan18")
                        defaults.synchronize()
                    }
                    if sender.tag == 3 {
                        Nisan18[questionNumber] = "3"
                        defaults.set(Nisan18, forKey: "Nisan18")
                        defaults.synchronize()
                    }
                    if sender.tag == 4 {
                        Nisan18[questionNumber] = "4"
                        defaults.set(Nisan18, forKey: "Nisan18")
                        defaults.synchronize()
                    }
                   
                    wrongText.text = "Yanlış: \(incorrect)"
                    correctText.text = "Doğru: \(correct)"
                    sender.backgroundColor = UIColor.red
                    greatBtn()
                }
            } else {
                if sender.tag == selectedAnswer {
                 
                    print("correct")
                    sender.backgroundColor = UIColor.green
                    correctText.text = "Doğru: \(correct)"
                    wrongText.text = "Yanlış: \(incorrect)"
                    if sender.tag == 1 {
                        Nisan18[questionNumber] = "1"
                        defaults.set(Nisan18, forKey: "Nisan18")
                        defaults.synchronize()
                    }
                    if sender.tag == 2 {
                        Nisan18[questionNumber] = "2"
                        defaults.set(Nisan18, forKey: "Nisan18")
                        defaults.synchronize()
                    }
                    if sender.tag == 3 {
                        Nisan18[questionNumber] = "3"
                        defaults.set(Nisan18, forKey: "Nisan18")
                        defaults.synchronize()
                    }
                    if sender.tag == 4 {
                        Nisan18[questionNumber] = "4"
                        defaults.set(Nisan18, forKey: "Nisan18")
                        defaults.synchronize()
                    }
                    sender.backgroundColor = UIColor.green
                    wrongText.text = "Yanlış: \(incorrect)"
                    correctText.text = "Doğru: \(correct)"
                    
                } else {
                    if sender.tag == 1 {
                        Nisan18[questionNumber] = "1"
                        defaults.set(Nisan18, forKey: "Nisan18")
                        defaults.synchronize()
                    }
                    if sender.tag == 2 {
                        Nisan18[questionNumber] = "2"
                        defaults.set(Nisan18, forKey: "Nisan18")
                        defaults.synchronize()
                    }
                    if sender.tag == 3 {
                        Nisan18[questionNumber] = "3"
                        defaults.set(Nisan18, forKey: "Nisan18")
                        defaults.synchronize()
                    }
                    if sender.tag == 4 {
                        Nisan18[questionNumber] = "4"
                        defaults.set(Nisan18, forKey: "Nisan18")
                        defaults.synchronize()
                    }
                   
                    incorrect += 1
                    correct -= 1
                    wrongText.text = "Yanlış: \(incorrect)"
                    correctText.text = "Doğru: \(correct)"
                    sender.backgroundColor = UIColor.red
                    
                    greatBtn()
                }
            }
        }
        optionA.isEnabled = false
        optionB.isEnabled = false
        optionC.isEnabled = false
        optionD.isEnabled = false
        
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        
        if questionNumber <= allQuestions.list.count - 1 && questionNumber >= 0 {
            questionNumber += 1
            updataUI()
            qNoText.text = "\(questionNumber + 1).Soru"
            print("soru numarası \(questionNumber)")
            updateQuestion()
            
        } else {
            alert()
        }
        print(".... \(Nisan18) ....... " )
        
        correctText.text = "Doğru: \(correct)"
        wrongText.text = "Yanlış: \(incorrect)"
        
        if Nisan18[questionNumber] == "null" {
            answerText.text = "Daha önce cevaplanmadı"
            answerText.textColor = UIColor.blue
        } else {
            StartSave()
        }
        
        optionA.isEnabled = true
        optionB.isEnabled = true
        optionC.isEnabled = true
        optionD.isEnabled = true
        optionA.backgroundColor = UIColor.white
        optionB.backgroundColor = UIColor.white
        optionC.backgroundColor = UIColor.white
        optionD.backgroundColor = UIColor.white
        nexttBtn.isHidden = false
        score007 += 1
    }
    
    func greatBtn() {
        
        if  selectedAnswer == 1 {
            optionA.backgroundColor = UIColor.green
        }
        if selectedAnswer == 2 {
            optionB.backgroundColor = UIColor.green
        }
        if selectedAnswer == 3 {
            optionC.backgroundColor = UIColor.green
        }
        if selectedAnswer == 4 {
            optionD.backgroundColor = UIColor.green
        }
    }
    
    func StartSave() {
        if optionA.tag == Int(Nisan18[questionNumber]) && selectedAnswer == 1 {
            answerText.textColor = UIColor(red: 0, green: 0.5686, blue: 0.0471, alpha: 1.0)
            answerText.text = "Önceki Cevap: Doğru"
        }
        if optionA.tag == Int(Nisan18[questionNumber]) && selectedAnswer != 1 {
            answerText.text = "Önceki Cevap: Yanlış"
            answerText.textColor = UIColor.red
        }
        if optionB.tag == Int(Nisan18[questionNumber]) && selectedAnswer == 2 {
            answerText.text = "Önceki Cevap: Doğru"
            answerText.textColor = UIColor(red: 0, green: 0.5686, blue: 0.0471, alpha: 1.0)
        }
        if optionB.tag == Int(Nisan18[questionNumber]) && selectedAnswer != 2 {
            answerText.text = "Önceki Cevap: Yanlış"
            answerText.textColor = UIColor.red
        }
        if optionC.tag == Int(Nisan18[questionNumber]) && selectedAnswer == 3 {
            answerText.text = "Önceki Cevap: Doğru"
            answerText.textColor = UIColor(red: 0, green: 0.5686, blue: 0.0471, alpha: 1.0)
        }
        if optionC.tag == Int(Nisan18[questionNumber]) && selectedAnswer != 3 {
            answerText.text = "Önceki Cevap: Yanlış"
            answerText.textColor = UIColor.red
        }
        if optionD.tag == Int(Nisan18[questionNumber]) && selectedAnswer == 4 {
            answerText.text = "Önceki Cevap: Doğru"
            answerText.textColor = UIColor(red: 0, green: 0.5686, blue: 0.0471, alpha: 1.0)
        }
        if optionD.tag == Int(Nisan18[questionNumber]) && selectedAnswer != 4 {
            answerText.text = "Önceki Cevap: Yanlış"
            answerText.textColor = UIColor.red
        }
    }
    
    @IBAction func restartBtn(_ sender: Any) {
        formating()
    }
    
    func formating() {
        let alertController = UIAlertController(title: "UYARI", message: "Bu testteki verdiğiniz tüm yanıtların kayıtlarını silerek, sıfırlamak istiyormusunuz ?", preferredStyle: UIAlertController.Style.alert)
        
        let ok = UIAlertAction(title: "EVET", style: UIAlertAction.Style.default, handler: {(action) -> Void in
            
            self.defaults.removeObject(forKey: "save")
            self.defaults.synchronize()
            self.correct = 0
            self.incorrect = 0
            self.correctText.text = "Doğru: \(self.correct)"
            self.wrongText.text = "Yanlış: \(self.incorrect)"
            self.Nisan18 = ["null", "null","null","null","null","null","null"]
            if self.Nisan18[self.questionNumber] == "null" {
                self.answerText.text = "Daha önce cevaplanmadı"
                self.answerText.textColor = UIColor.blue
                
            }
        })
        
        let cancel = UIAlertAction(title: "HAYIR", style: UIAlertAction.Style.default, handler: {(action) -> Void in
            
        })
        
        alertController.addAction(ok)
        alertController.addAction(cancel)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func prevBtn(_ sender: Any) {
        
        print(".... \(Nisan18) ....... " )
        
        if questionNumber <= allQuestions.list.count - 1 && questionNumber > 0{
            questionNumber -= 1
            updataUI()
            qNoText.text = "\(questionNumber + 1).Soru"
            print("soru numarası \(questionNumber)")
            updateQuestion()
            
        }
        
        if Nisan18[questionNumber] == "null" {
            answerText.text = "Daha önce cevaplanmadı"
            answerText.textColor = UIColor.blue
        } else {
            StartSave()
        }
        
        optionA.isEnabled = true
        optionB.isEnabled = true
        optionC.isEnabled = true
        optionD.isEnabled = true
        optionA.backgroundColor = UIColor.white
        optionB.backgroundColor = UIColor.white
        optionC.backgroundColor = UIColor.white
        optionD.backgroundColor = UIColor.white
    }
    
    func alert() {
        let alertController = UIAlertController(title: "SONUÇ", message: "\n\nToplam Doğru Sayısı: " + String(format: "%.0f",(Float(correct) / 6) * 100) + "\n\nToplam Yanlış Sayısı: " + String(incorrect), preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "TAMAM", style: UIAlertAction.Style.default, handler: {(action) -> Void in
            
            UserDefaults.standard.set(self.correct, forKey: "vaCNisan18")
            UserDefaults.standard.synchronize()
            UserDefaults.standard.set(self.incorrect, forKey: "vaINisan18")
            UserDefaults.standard.synchronize()
            
            self.resultSave()
            
            self.performSegue(withIdentifier: "saNisan18", sender: self)
        })
        
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if UserDefaults.standard.object(forKey: "vaCNisan18") != nil {
            self.correct = UserDefaults.standard.object(forKey: "vaCNisan18") as! Int
        }
        if UserDefaults.standard.object(forKey: "vaINisan18") != nil {
            self.incorrect = UserDefaults.standard.object(forKey: "vaINisan18") as! Int
        }
        
        let anisan18 = segue.destination as! trafikAdabi17
        anisan18.correctNisan18 = correct
        anisan18.incorrectNisan18 = incorrect
        anisan18.puanNisan18 = String(correct*2)
        
    }
    
    func resultSave() {
        
        let date = Date()
        
        let calender = Calendar.current
        let day = calender.component(.day, from: date)
        let month = calender.component(.month, from: date)
        let years = calender.component(.year, from: date)
        let hour = calender.component(.hour, from: date)
        let minute = calender.component(.minute, from: date)
        let saniye = calender.component(.second, from: date)
        
        var tarihh:String = ""
        var saat: String = ""
        
        tarihh = "\(day).\(month).\(years)"
        saat =  String(format: "%02d:%02d:%02d",hour,minute,saniye)
        
        let result = Sonuclar(context: resultService.contex)
        result.dersadi = "21 Nisan 2018 Trafik Adabı"
        result.tarih = tarihh
        result.dogru = Int16(self.correct)
        result.yanlis = Int16(self.incorrect)
        result.puan = Float((Float(self.correct) / 6) * 100 )
        result.x = Float(self.correct) / 6
        result.saat = saat
        resultService.saveContext()
    }
    
    func updataUI() {
        progresView.frame.size.width = (viewProgress.frame.size.width / CGFloat(allQuestions.list.count - 1)) * CGFloat(questionNumber)
        print("\(questionNumber)")
    }
    
   
    
    func CreatAndLoadIntertial () -> GADInterstitial? {
        
        fullScreenads = GADInterstitial(adUnitID: "ca-app-pub-3280232024910555/9624724415")
        guard let fullScreenads = fullScreenads else {
            return nil
        }
        
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        fullScreenads.load(request)
        fullScreenads.delegate = self
        
        return fullScreenads
    }
    
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        print("ads loaded")
        ad.present(fromRootViewController: self)
    }
    
    func interstitialDidFail(toPresentScreen ad: GADInterstitial) {
        print("ads load")
    }
    
    func alertreklamtikla(){
        let alertController = UIAlertController(title: "PUAN VERMEK İSTERMİSİNİZ ?", message: "\n\n Uygulamaya 5 yıldız vererek reklam sayısını ciddi oranda azaltabilirsiniz.", preferredStyle: UIAlertController.Style.alert)
        
        let ok = UIAlertAction(title: "EVET", style: UIAlertAction.Style.default, handler: {(action) -> Void in
            
            self.score007 = self.score007 + 1
            UserDefaults.standard.set(self.score007, forKey: "val007")
            UserDefaults.standard.synchronize()
            // App Store URL.
            let appStoreLink = "https://itunes.apple.com/ae/app/ehliyet-%C3%A7%C4%B1km%C4%B1%C5%9F-sorular-2018/id1299515538?mt=8"
            
            /* First create a URL, then check whether there is an installed app that can
             open it on the device. */
            if let url = URL(string: appStoreLink), UIApplication.shared.canOpenURL(url) {
                // Attempt to open the URL.
                UIApplication.shared.open(url, options: [:], completionHandler: {(success: Bool) in
                    if success {
                        print("Launching \(url) was successful")
                    }})
            }
        })
        
        alertController.addAction(ok)
        let HAYIR = UIAlertAction(title: "HAYIR", style: UIAlertAction.Style.default, handler: {(action) -> Void in
            
            self.fullScreenads = self.CreatAndLoadIntertial()
            
        })
        
        alertController.addAction(HAYIR)
        self.present(alertController, animated: true, completion: nil)
    }
}

