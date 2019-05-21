//
//  ilkyardimev.swift
//  Ehliyet-2017
//
//  Created by YILMAZ ER on 8.03.2018.
//  Copyright © 2018 YILMAZER. All rights reserved.
//

import UIKit
import WebKit
import SVProgressHUD
import GoogleMobileAds

class ilkyardimev: UIViewController, GADInterstitialDelegate {
    
    var sayac = Timer()
    
    var totalSec = 0
    
    var fullScreenads :GADInterstitial!
    
    @IBOutlet weak var webKit: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SVProgressHUD.show(withStatus: "Yükleniyor...")
        
        let url = URL(string: "https://youtu.be/-v8nW_ctR3k")
        let request = URLRequest(url: url!)
        
        webKit.load(request)
        SVProgressHUD.dismiss(withDelay: 7)
        
        self.fullScreenads = self.CreatAndLoadIntertial()
        
        timeQuestion()

        // Do any additional setup after loading the view.
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
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


