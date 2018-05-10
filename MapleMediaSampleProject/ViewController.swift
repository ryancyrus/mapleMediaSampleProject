//
//  ViewController.swift
//  MapleMediaSampleProject
//
//  Created by Ryan on 2018-05-10.
//  Copyright © 2018 Ryan. All rights reserved.
//

import UIKit

import GoogleMobileAds

import MoPub


class ViewController: UIViewController, MPInterstitialAdControllerDelegate {
    
    var interstitialAd: GADInterstitial!
    
    var mopubAdController: MPInterstitialAdController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let showAdButton = UIButton()
        showAdButton.frame = CGRect(x: 55, y: 55, width: 100, height: 100)
        showAdButton.setTitle("Show AdMob Ad", for: .normal)
        showAdButton.setTitleColor(UIColor.blue, for: .normal)
        showAdButton.addTarget(self, action: #selector(showAd), for: .touchUpInside)
        self.view.addSubview(showAdButton)
        
        let showMopubAdButton = UIButton()
        showMopubAdButton.frame = CGRect(x: 55, y: 305, width: 100, height: 100)
        showMopubAdButton.setTitle("Show Mopub Ad", for: .normal)
        showMopubAdButton.setTitleColor(UIColor.blue, for: .normal)
        showMopubAdButton.addTarget(self, action: #selector(showMopubAd), for: .touchUpInside)
        self.view.addSubview(showMopubAdButton)
        
        interstitialAd = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        let request = GADRequest()
        interstitialAd.load(request)
        
        mopubAdController = MPInterstitialAdController.init(forAdUnitId: "e46885c1b4674aec92af837c372073e3")
        mopubAdController?.delegate = self
        mopubAdController.loadAd()
        
        
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
    
    @objc func showMopubAd(){
        if mopubAdController.ready {
            mopubAdController.show(from: self)
        } else {
            print("MopubAd wasn't ready")
        }
    }


}

