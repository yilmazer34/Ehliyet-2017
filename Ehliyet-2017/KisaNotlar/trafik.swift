//
//  trafik.swift
//  Ehliyet
//
//  Created by YILMAZ ER on 20.12.2017.
//  Copyright © 2017 YILMAZ ER. All rights reserved.
//

import UIKit
import GoogleMobileAds

class trafik: UIViewController , GADInterstitialDelegate {
    
    var sayac = Timer()
    
    var totalSec = 0
    
    var score4 = 0
    
    var fullScreenads :GADInterstitial!
    
    @IBOutlet weak var WebWiew: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "val4") != nil {
            self.score4 = UserDefaults.standard.object(forKey: "val4") as! Int
        }
        
        self.fullScreenads = self.CreatAndLoadIntertial()
        
        let pdfAdress = URL(fileURLWithPath: Bundle.main.path(forResource: "trafik", ofType: "pdf")!)
        let baglantiTalebi = URLRequest(url: pdfAdress)
        WebWiew.loadRequest(baglantiTalebi)
        
        timeQuestion()
        
    }
    
    func timeQuestion() {
        
        sayac = Timer.scheduledTimer(timeInterval: 10, target: self, selector: (#selector(self.updataTime)), userInfo: nil, repeats: true)
    }
    
    @objc func updataTime() {
        
        if totalSec == 60 {
            totalSec = 0
            print(totalSec)
        } else {
            totalSec = totalSec + 1
            print(totalSec)
        }
        
        if totalSec == 60 {
            print(totalSec)
            self.fullScreenads = self.CreatAndLoadIntertial()
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
    
    override func viewDidAppear(_ animated: Bool) {
        
        if score4 == 0 {
            myAlert(title: "REKLAMI AZALT", message: "Bundan sonraki geleçek reklama tıklayarak uygulamanın daha gelişmesine katkıda bulunmuş olursunuz hemde reklamları azaltmış olursunuz.\n\nSınavda Başarılar Dileriz.")
        }
        if score4 >= 1 {
        }
    }
    
    func myAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "TAMAM", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            
            self.fullScreenads = self.CreatAndLoadIntertial()
            
            self.score4 =  self.score4 + 1
            
            UserDefaults.standard.set(self.score4, forKey: "val4")
            UserDefaults.standard.synchronize()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}

