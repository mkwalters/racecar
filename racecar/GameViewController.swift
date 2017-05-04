//
//  GameViewController.swift
//  racecar
//
//  Created by Walters Mitch on 3/20/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import GoogleMobileAds
import CoreGraphics

class GameViewController: UIViewController {
    
    var googleBannerView: GADBannerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menuScene = MenuScene(size: CGSize(width: 750, height: 1334))
        //MenuScene.
        let skView = view as! SKView
//        skView.showsFPS = true
//        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        //menuScene.scaleMode = .resizeFill
        menuScene.viewController = self
        skView.presentScene(menuScene)
    }
    

    override var shouldAutorotate: Bool {
        return true
    }
    

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        googleBannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
        googleBannerView.adUnitID = "ca-app-pub-7570294198997787/3091494959"
        
        googleBannerView.rootViewController = self
        let request: GADRequest = GADRequest()
        request.testDevices = ["25c0bcb0d1bc91ac3a3e7ff59a1216f7"]
        //googleBannerView.load(request)
        
//        googleBannerView.frame = CGRect(0, view.bounds.height - googleBannerView.frame.size.height, googleBannerView.frame.size.width, googleBannerView.frame.size.height)
        
        googleBannerView.frame = CGRect(x: 0, y: view.bounds.height - googleBannerView.frame.size.height, width: googleBannerView.frame.size.width, height: googleBannerView.frame.size.height)
        
        
        
        self.view.addSubview(googleBannerView!)
        
        
        if let skView = self.view as? SKView {  //cast root as SKView
            if skView.scene == nil {
                //create and present gameScene
            }
        }
    }
    
    
    
}
