//
//  Qsubat18.swift
//  Ehliyet-Kazanin
//
//  Created by YILMAZ ER on 8.04.2018.
//  Copyright © 2018 YILMAZ ER. All rights reserved.
//

//
//  tamSubat18Quiz.swift
//  Ehliyet-Kazanin
//
//  Created by YILMAZ ER on 6.04.2018.
//  Copyright © 2018 YILMAZ ER. All rights reserved.
//

import UIKit
import GoogleMobileAds


class mSubat18: UIViewController, GADInterstitialDelegate   {
    
    var fullScreenads :GADInterstitial!
    
    let allQuestions = mSubat18Bank()
    var questionNumber: Int = 0
    var correct: Int = 0
    var incorrect: Int = 0
    var selectedAnswer: Int = 0
    
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
    
    var mSubat18 = ["null", "null","null","null","null","null", "null","null","null","null","null", "null","null","null","null","null", "null","null","null","null","null", "null","null","null","null","null", "null","null","null","null","null", "null","null","null","null","null", "null","null","null","null","null", "null","null","null","null","null", "null","null","null","null","null","null","null","null", "null","null","null","null"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Motor (10 Şubat 2018)"
        
        if defaults.object(forKey: "mSubat18") != nil {
            self.mSubat18 = defaults.object(forKey: "mSubat18") as! [String]
            UserDefaults.standard.synchronize()
        }
        
        if defaults.object(forKey: "vmCSubat18") != nil {
            self.correct = defaults.object(forKey: "vmCSubat18") as! Int
            UserDefaults.standard.synchronize()
        }
        
        if defaults.object(forKey: "vmISubat18") != nil {
            self.incorrect = defaults.object(forKey: "vmISubat18") as! Int
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
        if mSubat18[questionNumber] == "null" {
            
            if sender.tag == selectedAnswer {
             
                print("correct")
                sender.backgroundColor = UIColor.green
                correct += 1
                correctText.text = "Doğru: \(correct)"
                if sender.tag == 1 {
                    mSubat18[questionNumber] = "1"
                    defaults.set(mSubat18, forKey: "mSubat18")
                }
                if sender.tag == 2 {
                    mSubat18[questionNumber] = "2"
                    defaults.set(mSubat18, forKey: "mSubat18")
                }
                if sender.tag == 3 {
                    mSubat18[questionNumber] = "3"
                    defaults.set(mSubat18, forKey: "mSubat18")
                }
                if sender.tag == 4 {
                    mSubat18[questionNumber] = "4"
                    defaults.set(mSubat18, forKey: "mSubat18")
                }
            } else {
                print("wrong")
             
                sender.backgroundColor = UIColor.red
                incorrect += 1
                wrongText.text = "Yanlış: \(incorrect)"
                if sender.tag == 1 {
                    mSubat18[questionNumber] = "1"
                    defaults.set(mSubat18, forKey: "mSubat18")
                    
                }
                if sender.tag == 2 {
                    mSubat18[questionNumber] = "2"
                    defaults.set(mSubat18, forKey: "mSubat18")
                    
                }
                if sender.tag == 3 {
                    mSubat18[questionNumber] = "3"
                    defaults.set(mSubat18, forKey: "mSubat18")
                    
                }
                if sender.tag == 4 {
                    mSubat18[questionNumber] = "4"
                    defaults.set(mSubat18, forKey: "mSubat18")
                    
                }
                greatBtn()
                self.fullScreenads = self.CreatAndLoadIntertial()
            }
            //            hav SAVE .....................................................................
        } else {
            
            if mSubat18[questionNumber] != String(selectedAnswer) {
                if sender.tag == selectedAnswer {
                    print("correct")
                  
                    sender.backgroundColor = UIColor.green
                    correct += 1
                    incorrect -= 1
                    correctText.text = "Doğru: \(correct)"
                    wrongText.text = "Yanlış: \(incorrect)"
                    if sender.tag == 1 {
                        mSubat18[questionNumber] = "1"
                        defaults.set(mSubat18, forKey: "mSubat18")
                        defaults.synchronize()
                    }
                    if sender.tag == 2 {
                        mSubat18[questionNumber] = "2"
                        defaults.set(mSubat18, forKey: "mSubat18")
                        defaults.synchronize()
                    }
                    if sender.tag == 3 {
                        mSubat18[questionNumber] = "3"
                        defaults.set(mSubat18, forKey: "mSubat18")
                        defaults.synchronize()
                    }
                    if sender.tag == 4 {
                        mSubat18[questionNumber] = "4"
                        defaults.set(mSubat18, forKey: "mSubat18")
                        defaults.synchronize()
                    }
                    sender.backgroundColor = UIColor.green
                    wrongText.text = "Yanlış: \(incorrect)"
                    correctText.text = "Doğru: \(correct)"
                    
                } else {
                    if sender.tag == 1 {
                        mSubat18[questionNumber] = "1"
                        defaults.set(mSubat18, forKey: "mSubat18")
                        defaults.synchronize()
                    }
                    if sender.tag == 2 {
                        mSubat18[questionNumber] = "2"
                        defaults.set(mSubat18, forKey: "mSubat18")
                        defaults.synchronize()
                    }
                    if sender.tag == 3 {
                        mSubat18[questionNumber] = "3"
                        defaults.set(mSubat18, forKey: "mSubat18")
                        defaults.synchronize()
                    }
                    if sender.tag == 4 {
                        mSubat18[questionNumber] = "4"
                        defaults.set(mSubat18, forKey: "mSubat18")
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
                        mSubat18[questionNumber] = "1"
                        defaults.set(mSubat18, forKey: "mSubat18")
                        defaults.synchronize()
                    }
                    if sender.tag == 2 {
                        mSubat18[questionNumber] = "2"
                        defaults.set(mSubat18, forKey: "mSubat18")
                        defaults.synchronize()
                    }
                    if sender.tag == 3 {
                        mSubat18[questionNumber] = "3"
                        defaults.set(mSubat18, forKey: "mSubat18")
                        defaults.synchronize()
                    }
                    if sender.tag == 4 {
                        mSubat18[questionNumber] = "4"
                        defaults.set(mSubat18, forKey: "mSubat18")
                        defaults.synchronize()
                    }
                    sender.backgroundColor = UIColor.green
                    wrongText.text = "Yanlış: \(incorrect)"
                    correctText.text = "Doğru: \(correct)"
                    
                } else {
                    if sender.tag == 1 {
                        mSubat18[questionNumber] = "1"
                        defaults.set(mSubat18, forKey: "mSubat18")
                        defaults.synchronize()
                    }
                    if sender.tag == 2 {
                        mSubat18[questionNumber] = "2"
                        defaults.set(mSubat18, forKey: "mSubat18")
                        defaults.synchronize()
                    }
                    if sender.tag == 3 {
                        mSubat18[questionNumber] = "3"
                        defaults.set(mSubat18, forKey: "mSubat18")
                        defaults.synchronize()
                    }
                    if sender.tag == 4 {
                        mSubat18[questionNumber] = "4"
                        defaults.set(mSubat18, forKey: "mSubat18")
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
        print(".... \(mSubat18) ....... " )
        
        correctText.text = "Doğru: \(correct)"
        wrongText.text = "Yanlış: \(incorrect)"
        
        if mSubat18[questionNumber] == "null" {
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
    }
    
    func StartSave() {
        if optionA.tag == Int(mSubat18[questionNumber]) && selectedAnswer == 1 {
            answerText.textColor = UIColor(red: 0, green: 0.5686, blue: 0.0471, alpha: 1.0)
            answerText.text = "Önceki Cevap: Doğru"
        }
        if optionA.tag == Int(mSubat18[questionNumber]) && selectedAnswer != 1 {
            answerText.text = "Önceki Cevap: Yanlış"
            answerText.textColor = UIColor.red
        }
        if optionB.tag == Int(mSubat18[questionNumber]) && selectedAnswer == 2 {
            answerText.text = "Önceki Cevap: Doğru"
            answerText.textColor = UIColor(red: 0, green: 0.5686, blue: 0.0471, alpha: 1.0)
        }
        if optionB.tag == Int(mSubat18[questionNumber]) && selectedAnswer != 2 {
            answerText.text = "Önceki Cevap: Yanlış"
            answerText.textColor = UIColor.red
        }
        if optionC.tag == Int(mSubat18[questionNumber]) && selectedAnswer == 3 {
            answerText.text = "Önceki Cevap: Doğru"
            answerText.textColor = UIColor(red: 0, green: 0.5686, blue: 0.0471, alpha: 1.0)
        }
        if optionC.tag == Int(mSubat18[questionNumber]) && selectedAnswer != 3 {
            answerText.text = "Önceki Cevap: Yanlış"
            answerText.textColor = UIColor.red
        }
        if optionD.tag == Int(mSubat18[questionNumber]) && selectedAnswer == 4 {
            answerText.text = "Önceki Cevap: Doğru"
            answerText.textColor = UIColor(red: 0, green: 0.5686, blue: 0.0471, alpha: 1.0)
        }
        if optionD.tag == Int(mSubat18[questionNumber]) && selectedAnswer != 4 {
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
            
            self.correct = 0
            self.incorrect = 0
            self.defaults.removeObject(forKey: "mSubat18")
            self.defaults.synchronize()
            self.correctText.text = "Doğru: \(self.correct)"
            self.wrongText.text = "Yanlış: \(self.incorrect)"
            self.mSubat18 = ["null", "null","null","null","null","null", "null","null","null","null","null", "null","null","null","null","null", "null","null","null","null","null", "null","null","null","null","null", "null","null","null","null","null", "null","null","null","null","null", "null","null","null","null","null", "null","null","null","null","null","null","null", "null","null","null","null"]
            if self.mSubat18[self.questionNumber] == "null" {
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
        
        print(".... \(mSubat18) ....... " )
        
        if questionNumber <= allQuestions.list.count - 1 && questionNumber > 0{
            questionNumber -= 1
            updataUI()
            qNoText.text = "\(questionNumber + 1).Soru"
            print("soru numarası \(questionNumber)")
            updateQuestion()
            
        }
        
        if mSubat18[questionNumber] == "null" {
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
    
    func alert(){
        
        let alertController = UIAlertController(title: "SONUÇ", message: "\n\nToplam Doğru Sayısı: " + String(correct) + "\n\nToplam Yanlış Sayısı: " + String(incorrect), preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "TAMAM", style: UIAlertAction.Style.default, handler: {(action) -> Void in
            
            UserDefaults.standard.set(self.correct, forKey: "vmCSubat18")
            UserDefaults.standard.synchronize()
            UserDefaults.standard.set(self.incorrect, forKey: "vmISubat18")
            UserDefaults.standard.synchronize()
            self.resultSave()
            self.performSegue(withIdentifier: "smSubat18", sender: self)
        })
        
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if UserDefaults.standard.object(forKey: "vmCSubat18") != nil {
            self.correct = UserDefaults.standard.object(forKey: "vmCSubat18") as! Int
        }
        if UserDefaults.standard.object(forKey: "vmISubat18") != nil {
            self.incorrect = UserDefaults.standard.object(forKey: "vmISubat18") as! Int
        }
        
        let msubat18 = segue.destination as! motor17
        msubat18.correctSubat18 = correct
        msubat18.incorrectSubat18 = incorrect
    }
    
    func updataUI() {
        progresView.frame.size.width = (viewProgress.frame.size.width / CGFloat(allQuestions.list.count - 1)) * CGFloat(questionNumber)
        print("\(questionNumber)")
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
        result.dersadi = "10 Şubat 2018 Motor"
        result.tarih = tarihh
        result.dogru = Int16(self.correct)
        result.yanlis = Int16(self.incorrect)
        result.puan = Float((Float(self.correct) / 9) * 100 )
        result.x = Float(self.correct) / 9
        result.saat = saat
        resultService.saveContext()
    }
}


