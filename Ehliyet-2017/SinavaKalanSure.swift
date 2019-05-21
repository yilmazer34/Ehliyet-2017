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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fullScreenads = self.CreatAndLoadIntertial()
   
        
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
