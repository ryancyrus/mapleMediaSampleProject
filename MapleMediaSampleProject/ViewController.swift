//
//  ViewController.swift
//  MapleMediaSampleProject
//
//  Created by Ryan on 2018-05-10.
//  Copyright © 2018 Ryan. All rights reserved.
//

import UIKit

import GoogleMobileAds

class ViewController: UIViewController {
    
    var interstitialAd: GADInterstitial!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let showAdButton = UIButton()
        showAdButton.frame = CGRect(x: 55, y: 55, width: 100, height: 100)
        showAdButton.setTitle("Show Ad", for: .normal)
        showAdButton.setTitleColor(UIColor.blue, for: .normal)
        showAdButton.addTarget(self, action: #selector(showAd), for: .touchUpInside)
        self.view.addSubview(showAdButton)
        
        interstitialAd = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        let request = GADRequest()
        interstitialAd.load(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func showAd() {
        if interstitialAd.isReady {
            interstitialAd.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready")
        }
    }


}

