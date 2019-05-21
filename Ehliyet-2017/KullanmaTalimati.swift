//
//  KullanmaTalimati.swift
//  Ehliyet-2017
//
//  Created by YILMAZ ER on 26.02.2018.
//  Copyright © 2018 YILMAZER. All rights reserved.
//

import UIKit
import WebKit
import GoogleMobileAds

class KullanmaTalimati: UIViewController, GADInterstitialDelegate  {

    @IBOutlet weak var webkit: WKWebView!
    
    var fullScreenads :GADInterstitial!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://youtu.be/Kt_3HYfjp2s")
        let request = URLRequest(url: url!)
        
        webkit.load(request)
        
        self.fullScreenads = self.CreatAndLoadIntertial()

        // Do any additional setup after loading the view.
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
        //
        //        if totalSec == 60 {
        //            print("\(totalSec) reklamMetod")
        //            reklamMetod()
        //        }
        
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
