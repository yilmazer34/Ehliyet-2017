//
//  SinavaKalanSure.swift
//  Ehliyet-2017
//
//  Created by YILMAZ ER on 18.02.2018.
//  Copyright © 2018 YILMAZER. All rights reserved.
//

import UIKit
import GoogleMobileAds

class SinavaKalanSure: UIViewController, GADInterstitialDelegate  {
    
    var sureKalan = 0
    
    var fullScreenads :GADInterstitial!

    @IBOutlet weak var timeCircle: CirclePath!
    
    @IBOutlet weak var timeText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fullScreenads = self.CreatAndLoadIntertial()
        
        let date = Date()
        
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .short
        timeText.text = "\(formatter.string(from: date))"

        let calender = Calendar.current
        
        let day = calender.component(.day, from: date)
        
        if day == 30 {
            sureKalan = sureKalan + 1
        }
        
        if sureKalan == 0 {
            timeText.text = "\(51 - day) Gün Kaldı"
            print("\(day) mart ayı için")
        }
        
        if sureKalan == 1 {
            timeText.text = "\(20 - day) Gün Kaldı"
            print("\(day) nisan ayı için")
        }
        timeCircle.value = ((Float(51 - day)/(78)))
        
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
