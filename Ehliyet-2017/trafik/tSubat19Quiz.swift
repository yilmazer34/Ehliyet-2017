//
//  tSubat19Quiz.swift
//  Ehliyet-2017
//
//  Created by YILMAZ ER on 3/1/19.
//  Copyright © 2019 YILMAZER. All rights reserved.
//

import UIKit
import GoogleMobileAds


class tSubat19Quiz: UIViewController,  GADInterstitialDelegate   {
    
    var fullScreenads :GADInterstitial!
    
    let allQuestions = tSubat19Bank()
    var questionNumber: Int = 0
    var correct: Int = 0
    var incorrect: Int = 0
    var selectedAnswer: Int = 0
    
    
    @IBOutlet weak var qNoText: UILabel!
    @IBOutlet weak var wrongText: UILabel!
    @IBOutlet weak var correctText: UILabel!
    @IBOutlet weak var qImage: UIImageView!
    @IBOutlet weak var optionA: RoundButton!
    @IBOutlet weak var optionB: RoundButton!
    @IBOutlet weak var optionC: RoundButton!
    @IBOutlet weak var optionD: RoundButton!
    @IBOutlet weak var nexttBtn: RoundButton!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Trafik Şubat 2019 E-Sınav"
        
        correctText.text = "Doğru: \(correct)"
        wrongText.text = "Yanlış: \(incorrect)"
        
        updateQuestion()
        
    }
    
    @IBAction func finishQuiz(_ sender: Any) {
        alert()
    }
    
    func updateQuestion(){
        if  questionNumber <= allQuestions.list.count - 1 {
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
        
        if sender.tag == selectedAnswer {
          
            print("correct")
            sender.backgroundColor = UIColor.green
            correct += 1
            correctText.text = "Doğru: \(correct)"
            
        } else {
            print("wrong")
           
            sender.backgroundColor = UIColor.red
            incorrect += 1
            wrongText.text = "Yanlış: \(incorrect)"
            greatBtn()
            self.fullScreenads = self.CreatAndLoadIntertial()
        }
        
        optionA.isEnabled = false
        optionB.isEnabled = false
        optionC.isEnabled = false
        optionD.isEnabled = false
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        
        if questionNumber <= allQuestions.list.count {
            questionNumber += 1
            qNoText.text = "\(questionNumber + 1).Soru"
            print("soru numarası \(questionNumber)")
            updateQuestion()
            
        } else {
            alert()
        }
        
        correctText.text = "Doğru: \(correct)"
        wrongText.text = "Yanlış: \(incorrect)"
        
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
    
    func alert(){
        
        let alertController = UIAlertController(title: "SONUÇ", message: "\n\nAldığınız Puan: " + String(format: "%.0f",(Float(correct) / 23) * 100) + "\n\nToplam Doğru Sayısı: " + String(correct) + "\n\nToplam Yanlış Sayısı: " + String(incorrect), preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "TAMAM", style: UIAlertAction.Style.default, handler: {(action) -> Void in
            
            UserDefaults.standard.set(self.correct, forKey: "vtSubat19")
            UserDefaults.standard.synchronize()
            UserDefaults.standard.set(self.incorrect, forKey: "vtISubat19")
            UserDefaults.standard.synchronize()
            self.resultSave()
            self.performSegue(withIdentifier: "tSubat19", sender: self)
        })
        
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if UserDefaults.standard.object(forKey: "vtCSubat19") != nil {
            self.correct = UserDefaults.standard.object(forKey: "vtCSubat19") as! Int
        }
        if UserDefaults.standard.object(forKey: "vtISubat19") != nil {
            self.incorrect = UserDefaults.standard.object(forKey: "vtISubat19") as! Int
        }
        
        let tSubat19 = segue.destination as! trafik17
        tSubat19.correctSubat19 = correct
        tSubat19.incorrectSubat19 = incorrect
        tSubat19.puanSubat19 = String(correct*2)
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
        result.dersadi = "Trafik Şubat 2019 E-Sınav"
        result.tarih = tarihh
        result.dogru = Int16(self.correct)
        result.yanlis = Int16(self.incorrect)
        result.puan = Float((Float(self.correct) / 23) * 100 )
        result.x = Float(self.correct) / 23
        result.saat = saat
        resultService.saveContext()
    }
}


