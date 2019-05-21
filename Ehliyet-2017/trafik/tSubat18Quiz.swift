




import UIKit
import GoogleMobileAds
import KRProgressHUD

class tSubat18Quiz: UIViewController, GADInterstitialDelegate   {
    
    var fullScreenads :GADInterstitial!
    
    let allQuestions = tSubat18Bank()
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
    
    var Tsubat18 = ["null", "null","null","null","null","null","null","null", "null","null","null","null","null","null","null", "null","null","null","null","null","null","null","null","null"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Trafik (10 Şubat 2018)"
        
        if defaults.object(forKey: "Tsubat18") != nil {
            self.Tsubat18 = defaults.object(forKey: "Tsubat18") as! [String]
            UserDefaults.standard.synchronize()
        }
        
        if defaults.object(forKey: "vtCSubat18") != nil {
            self.correct = defaults.object(forKey: "vtCSubat18") as! Int
            UserDefaults.standard.synchronize()
        }
        
        if defaults.object(forKey: "vtISubat18") != nil {
            self.incorrect = defaults.object(forKey: "vtISubat18") as! Int
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
            optionA.setTitle(allQuestions.list[questionNumber].optionA, for: UIControlState.normal)
            optionB.setTitle(allQuestions.list[questionNumber].optionB, for: UIControlState.normal)
            optionC.setTitle(allQuestions.list[questionNumber].optionC, for: UIControlState.normal)
            optionD.setTitle(allQuestions.list[questionNumber].optionD, for: UIControlState.normal)
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
        if Tsubat18[questionNumber] == "null" {
            
            if sender.tag == selectedAnswer {
                Correct()
                print("correct")
                sender.backgroundColor = UIColor.green
                correct += 1
                correctText.text = "Doğru: \(correct)"
                if sender.tag == 1 {
                    Tsubat18[questionNumber] = "1"
                    defaults.set(Tsubat18, forKey: "Tsubat18")
                }
                if sender.tag == 2 {
                    Tsubat18[questionNumber] = "2"
                    defaults.set(Tsubat18, forKey: "Tsubat18")
                }
                if sender.tag == 3 {
                    Tsubat18[questionNumber] = "3"
                    defaults.set(Tsubat18, forKey: "Tsubat18")
                }
                if sender.tag == 4 {
                    Tsubat18[questionNumber] = "4"
                    defaults.set(Tsubat18, forKey: "Tsubat18")
                }
            } else {
                print("wrong")
                Wrong()
                sender.backgroundColor = UIColor.red
                incorrect += 1
                wrongText.text = "Yanlış: \(incorrect)"
                if sender.tag == 1 {
                    Tsubat18[questionNumber] = "1"
                    defaults.set(Tsubat18, forKey: "Tsubat18")
                    
                }
                if sender.tag == 2 {
                    Tsubat18[questionNumber] = "2"
                    defaults.set(Tsubat18, forKey: "Tsubat18")
                    
                }
                if sender.tag == 3 {
                    Tsubat18[questionNumber] = "3"
                    defaults.set(Tsubat18, forKey: "Tsubat18")
                    
                }
                if sender.tag == 4 {
                    Tsubat18[questionNumber] = "4"
                    defaults.set(Tsubat18, forKey: "Tsubat18")
                    
                }
                greatBtn()
                self.fullScreenads = self.CreatAndLoadIntertial()
            }
            //            hav SAVE .....................................................................
        } else {
            
            if Tsubat18[questionNumber] != String(selectedAnswer) {
                if sender.tag == selectedAnswer {
                    print("correct")
                    Correct()
                    sender.backgroundColor = UIColor.green
                    correct += 1
                    incorrect -= 1
                    correctText.text = "Doğru: \(correct)"
                    wrongText.text = "Yanlış: \(incorrect)"
                    if sender.tag == 1 {
                        Tsubat18[questionNumber] = "1"
                        defaults.set(Tsubat18, forKey: "Tsubat18")
                        defaults.synchronize()
                    }
                    if sender.tag == 2 {
                        Tsubat18[questionNumber] = "2"
                        defaults.set(Tsubat18, forKey: "Tsubat18")
                        defaults.synchronize()
                    }
                    if sender.tag == 3 {
                        Tsubat18[questionNumber] = "3"
                        defaults.set(Tsubat18, forKey: "Tsubat18")
                        defaults.synchronize()
                    }
                    if sender.tag == 4 {
                        Tsubat18[questionNumber] = "4"
                        defaults.set(Tsubat18, forKey: "Tsubat18")
                        defaults.synchronize()
                    }
                    sender.backgroundColor = UIColor.green
                    wrongText.text = "Yanlış: \(incorrect)"
                    correctText.text = "Doğru: \(correct)"
                    
                } else {
                    if sender.tag == 1 {
                        Tsubat18[questionNumber] = "1"
                        defaults.set(Tsubat18, forKey: "Tsubat18")
                        defaults.synchronize()
                    }
                    if sender.tag == 2 {
                        Tsubat18[questionNumber] = "2"
                        defaults.set(Tsubat18, forKey: "Tsubat18")
                        defaults.synchronize()
                    }
                    if sender.tag == 3 {
                        Tsubat18[questionNumber] = "3"
                        defaults.set(Tsubat18, forKey: "Tsubat18")
                        defaults.synchronize()
                    }
                    if sender.tag == 4 {
                        Tsubat18[questionNumber] = "4"
                        defaults.set(Tsubat18, forKey: "Tsubat18")
                        defaults.synchronize()
                    }
                    Wrong()
                    wrongText.text = "Yanlış: \(incorrect)"
                    correctText.text = "Doğru: \(correct)"
                    sender.backgroundColor = UIColor.red
                    greatBtn()
                }
            } else {
                if sender.tag == selectedAnswer {
                    Correct()
                    print("correct")
                    sender.backgroundColor = UIColor.green
                    correctText.text = "Doğru: \(correct)"
                    wrongText.text = "Yanlış: \(incorrect)"
                    if sender.tag == 1 {
                        Tsubat18[questionNumber] = "1"
                        defaults.set(Tsubat18, forKey: "Tsubat18")
                        defaults.synchronize()
                    }
                    if sender.tag == 2 {
                        Tsubat18[questionNumber] = "2"
                        defaults.set(Tsubat18, forKey: "Tsubat18")
                        defaults.synchronize()
                    }
                    if sender.tag == 3 {
                        Tsubat18[questionNumber] = "3"
                        defaults.set(Tsubat18, forKey: "Tsubat18")
                        defaults.synchronize()
                    }
                    if sender.tag == 4 {
                        Tsubat18[questionNumber] = "4"
                        defaults.set(Tsubat18, forKey: "Tsubat18")
                        defaults.synchronize()
                    }
                    sender.backgroundColor = UIColor.green
                    wrongText.text = "Yanlış: \(incorrect)"
                    correctText.text = "Doğru: \(correct)"
                    
                } else {
                    if sender.tag == 1 {
                        Tsubat18[questionNumber] = "1"
                        defaults.set(Tsubat18, forKey: "Tsubat18")
                        defaults.synchronize()
                    }
                    if sender.tag == 2 {
                        Tsubat18[questionNumber] = "2"
                        defaults.set(Tsubat18, forKey: "Tsubat18")
                        defaults.synchronize()
                    }
                    if sender.tag == 3 {
                        Tsubat18[questionNumber] = "3"
                        defaults.set(Tsubat18, forKey: "Tsubat18")
                        defaults.synchronize()
                    }
                    if sender.tag == 4 {
                        Tsubat18[questionNumber] = "4"
                        defaults.set(Tsubat18, forKey: "Tsubat18")
                        defaults.synchronize()
                    }
                    Wrong()
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
        print(".... \(Tsubat18) ....... " )
        
        correctText.text = "Doğru: \(correct)"
        wrongText.text = "Yanlış: \(incorrect)"
        
        if Tsubat18[questionNumber] == "null" {
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
        if optionA.tag == Int(Tsubat18[questionNumber]) && selectedAnswer == 1 {
            answerText.textColor = UIColor(red: 0, green: 0.5686, blue: 0.0471, alpha: 1.0)
            answerText.text = "Önceki Cevap: Doğru"
        }
        if optionA.tag == Int(Tsubat18[questionNumber]) && selectedAnswer != 1 {
            answerText.text = "Önceki Cevap: Yanlış"
            answerText.textColor = UIColor.red
        }
        if optionB.tag == Int(Tsubat18[questionNumber]) && selectedAnswer == 2 {
            answerText.text = "Önceki Cevap: Doğru"
            answerText.textColor = UIColor(red: 0, green: 0.5686, blue: 0.0471, alpha: 1.0)
        }
        if optionB.tag == Int(Tsubat18[questionNumber]) && selectedAnswer != 2 {
            answerText.text = "Önceki Cevap: Yanlış"
            answerText.textColor = UIColor.red
        }
        if optionC.tag == Int(Tsubat18[questionNumber]) && selectedAnswer == 3 {
            answerText.text = "Önceki Cevap: Doğru"
            answerText.textColor = UIColor(red: 0, green: 0.5686, blue: 0.0471, alpha: 1.0)
        }
        if optionC.tag == Int(Tsubat18[questionNumber]) && selectedAnswer != 3 {
            answerText.text = "Önceki Cevap: Yanlış"
            answerText.textColor = UIColor.red
        }
        if optionD.tag == Int(Tsubat18[questionNumber]) && selectedAnswer == 4 {
            answerText.text = "Önceki Cevap: Doğru"
            answerText.textColor = UIColor(red: 0, green: 0.5686, blue: 0.0471, alpha: 1.0)
        }
        if optionD.tag == Int(Tsubat18[questionNumber]) && selectedAnswer != 4 {
            answerText.text = "Önceki Cevap: Yanlış"
            answerText.textColor = UIColor.red
        }
    }
    
    @IBAction func restartBtn(_ sender: Any) {
        formating()
    }
    
    func formating() {
        let alertController = UIAlertController(title: "UYARI", message: "Bu testteki verdiğiniz tüm yanıtların kayıtlarını silerek, sıfırlamak istiyormusunuz ?", preferredStyle: UIAlertControllerStyle.alert)
        
        let ok = UIAlertAction(title: "EVET", style: UIAlertActionStyle.default, handler: {(action) -> Void in
            
            self.correct = 0
            self.incorrect = 0
            self.defaults.removeObject(forKey: "Tsubat18")
            self.defaults.synchronize()
            self.correctText.text = "Doğru: \(self.correct)"
            self.wrongText.text = "Yanlış: \(self.incorrect)"
            self.Tsubat18 = ["null", "null","null","null","null","null", "null","null","null","null","null", "null","null","null","null","null", "null","null","null","null","null", "null","null","null","null","null", "null","null","null","null","null", "null","null","null","null","null", "null","null","null","null","null", "null","null","null","null"]
            if self.Tsubat18[self.questionNumber] == "null" {
                self.answerText.text = "Daha önce cevaplanmadı"
                self.answerText.textColor = UIColor.blue
            }
        })
        
        let cancel = UIAlertAction(title: "HAYIR", style: UIAlertActionStyle.default, handler: {(action) -> Void in
            
            
        })
        
        alertController.addAction(ok)
        alertController.addAction(cancel)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func prevBtn(_ sender: Any) {
        
        print(".... \(Tsubat18) ....... " )
        
        if questionNumber <= allQuestions.list.count - 1 && questionNumber > 0{
            questionNumber -= 1
            updataUI()
            qNoText.text = "\(questionNumber + 1).Soru"
            print("soru numarası \(questionNumber)")
            updateQuestion()
            
        }
        
        if Tsubat18[questionNumber] == "null" {
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
        
        let alertController = UIAlertController(title: "SONUÇ", message: "\n\nToplam Doğru Sayısı: " + String(correct) + "\n\nToplam Yanlış Sayısı: " + String(incorrect), preferredStyle: UIAlertControllerStyle.alert)
        let ok = UIAlertAction(title: "TAMAM", style: UIAlertActionStyle.default, handler: {(action) -> Void in
            
            UserDefaults.standard.set(self.correct, forKey: "vtCSubat18")
            UserDefaults.standard.synchronize()
            UserDefaults.standard.set(self.incorrect, forKey: "vtISubat18")
            UserDefaults.standard.synchronize()
            self.resultSave()
            self.performSegue(withIdentifier: "stSubat18", sender: self)
        })
        
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
        self.fullScreenads = self.CreatAndLoadIntertial()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if UserDefaults.standard.object(forKey: "vtCSubat18") != nil {
            self.correct = UserDefaults.standard.object(forKey: "vtCSubat18") as! Int
        }
        if UserDefaults.standard.object(forKey: "vtISubat18") != nil {
            self.incorrect = UserDefaults.standard.object(forKey: "vtISubat18") as! Int
        }
        
        let tsubat18 = segue.destination as! trafik17
        tsubat18.correctSubat18 = correct
        tsubat18.incorrectSubat18 = incorrect
        tsubat18.puanSubat18 = correct*2
    }
    
    func updataUI() {
        progresView.frame.size.width = (viewProgress.frame.size.width / CGFloat(allQuestions.list.count - 1)) * CGFloat(questionNumber)
        print("\(questionNumber)")
    }
    
    func Wrong() {
        KRProgressHUD.set(maskType: .black)
        KRProgressHUD.set(style: .custom(background: .white, text: .red, icon: nil))
        KRProgressHUD.set(font: UIFont.systemFont(ofSize: 20))
        KRProgressHUD.showError(withMessage: "YANLIŞ")
    }
    
    func Correct() {
        KRProgressHUD.set(style: .custom(background: .white, text: .green, icon: nil))
        KRProgressHUD.set(font: UIFont.systemFont(ofSize: 20))
        KRProgressHUD.showSuccess(withMessage: "DOĞRU")
    }
    
    func CreatAndLoadIntertial () -> GADInterstitial? {
        
        fullScreenads = GADInterstitial(adUnitID: "ca-app-pub-3280232024910555/4390451903")
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
        result.dersadi = "10 Şubat 2017 Trafik ve Çevre"
        result.tarih = tarihh
        result.dogru = Int16(self.correct)
        result.yanlis = Int16(self.incorrect)
        result.puan = Float((Float(self.correct) / 23) * 100 )
        result.x = Float(self.correct) / 23
        result.saat = saat
        resultService.saveContext()
    }
}




