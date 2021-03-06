//
//  SinavHakkinda.swift
//  Ehliyet
//
//  Created by YILMAZ ER on 20.12.2017.
//  Copyright © 2017 YILMAZ ER. All rights reserved.
//

import UIKit
import WebKit
import SVProgressHUD
import GoogleMobileAds

class SinavHakkinda: UIViewController, GADInterstitialDelegate  {
    
    var sayac = Timer()
    
    var totalSec = 0
    
    var fullScreenads :GADInterstitial!

    @IBOutlet weak var WebWiew: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SVProgressHUD.show(withStatus: "Yükleniyor...")
        
        let pdfAdress = URL(fileURLWithPath: Bundle.main.path(forResource: "ehliyetHakkinda", ofType: "pdf")!)
        let baglantiTalebi = URLRequest(url: pdfAdress)
        WebWiew.loadRequest(baglantiTalebi)
        
        SVProgressHUD.dismiss(withDelay: 1)
        
        self.fullScreenads = self.CreatAndLoadIntertial()
        
        timeQuestion()
        
    }
    
    func timeQuestion() {
        
        sayac = Timer.scheduledTimer(timeInterval: 5, target: self, selector: (#selector(self.updataTime)), userInfo: nil, repeats: true)
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
        print("reklam Yüklendi")
        
        return fullScreenads
    }
    
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        print("ads loaded")
        ad.present(fromRootViewController: self)
    }
    
    func interstitialDidFail(toPresentScreen ad: GADInterstitial) {
        print("ads load")
    }
    
}


