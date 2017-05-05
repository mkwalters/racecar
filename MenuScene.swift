//
//  MenuScene.swift
//  racecar
//
//  Created by Walters Mitch on 3/30/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.

//

//let yellow = UIColor(red: 252/255, green: 252/255, blue: 98/255, alpha: 1.0)
//let green = UIColor(red: 105/255, green: 153/255, blue: 98/255, alpha: 1.0)
//let blue = UIColor(red: 57/255, green: 70/255, blue: 72/255, alpha: 1.0)
//let purple = UIColor(red: 51/255, green: 0/255, blue: 54/255, alpha: 1.0)


let yellow = UIColor(red: 240/255, green: 200/255, blue: 8/255, alpha: 1.0)
let blue = UIColor(red: 8/255, green: 103/255, blue: 136/255, alpha: 1.0)
let white = UIColor(red: 255/255, green: 241/255, blue: 208/255, alpha: 1.0)
let red = UIColor(red: 221/255, green: 28/255, blue: 26/255, alpha: 1.0)



import SpriteKit
import SwiftyStoreKit
import StoreKit

class MenuScene: SKScene {
    
    let GrandPrix = SKLabelNode()
    let GrandPrixBackground = SKSpriteNode(color: blue, size: CGSize(width: 475, height: 115)  )
    
    let TimeTrials = SKLabelNode()
    let TimeTrialsBackground = SKSpriteNode(color: blue, size: CGSize(width: 475, height: 115)  )
    
    let HowToPlay = SKLabelNode()
    let HowToPlayBackground = SKSpriteNode(color: blue, size: CGSize(width: 250, height: 115)  )
    
    let velocity_title = SKLabelNode(text: "Bit")
    let vector_title = SKLabelNode(text: "Crawler")
    
    let ads = SKLabelNode(text: "ADS")
    
    var viewController : UIViewController!
    
    
    
    let red_circle_with_slash = SKSpriteNode(imageNamed: "RedCircle")

    override init(size: CGSize) {
        super.init(size: size)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.size = CGSize(width: 750, height: 1334)
        
        
        backgroundColor = SKColor.black
        
        vector_title.position = CGPoint(x: CGFloat(0), y: self.frame.height / 2 - 400)
        vector_title.fontName = "FasterOne-Regular"
        vector_title.fontColor = yellow
        vector_title.fontSize = 110
        addChild(vector_title)
        
        velocity_title.position = CGPoint(x: CGFloat(0), y: self.frame.height / 2 - 250)
        velocity_title.fontName = "FasterOne-Regular"
        velocity_title.fontColor = yellow
        velocity_title.fontSize = 110
        addChild(velocity_title)
        
        GrandPrixBackground.position = CGPoint(x: 0, y: 75)
        GrandPrixBackground.zPosition = 4
        addChild(GrandPrixBackground)
        
        GrandPrix.fontColor = yellow
        GrandPrix.fontName = "Arcade"
        GrandPrix.text = "Grand Prix"
        GrandPrix.fontSize = 100
        GrandPrix.position = CGPoint(x: 0, y: -50 )
        GrandPrix.zPosition = 5
        
        GrandPrixBackground.addChild(GrandPrix)
        

        
        
        
        TimeTrials.fontColor = yellow
        TimeTrials.fontName = "Arcade"
        TimeTrials.text = "Time Trials"
        TimeTrials.fontSize = 100
        TimeTrials.zPosition = 5
        
        TimeTrials.position = CGPoint(x: 0, y: -50)
        
        TimeTrialsBackground.position = CGPoint(x: 0, y: -105)
        TimeTrialsBackground.zPosition = 4
        
        addChild(TimeTrialsBackground)
        
        TimeTrialsBackground.addChild(TimeTrials)
        
        
        
        HowToPlayBackground.position = CGPoint(x: 0, y: -285)
        HowToPlayBackground.zPosition = 4
        
        addChild(HowToPlayBackground)
        
        HowToPlay.fontColor = yellow
        HowToPlay.fontName = "Arcade"
        HowToPlay.text = "Help"
        HowToPlay.fontSize = 100
        HowToPlay.zPosition = 5
        
        HowToPlay.position = CGPoint(x: 0, y: -50)
        
        HowToPlayBackground.addChild(HowToPlay)
        
        
        
//        SwiftyStoreKit.restorePurchases(atomically: true) { results in
//            if results.restoreFailedProducts.count > 0 {
//                print("Restore Failed: \(results.restoreFailedProducts)")
//            }
//            else if results.restoredProducts.count > 0 {
//                print("Restore Success: \(results.restoredProducts)")
//            }
//            else {
//                print("Nothing to Restore")
//                
//                
//                self.ads.position = CGPoint(x: 0, y: -525)
//                self.ads.fontName = "Arcade"
//                self.ads.fontSize = 50
//                self.ads.zPosition = 4
//                
//                
//                self.addChild(self.ads)
//                
//                
//                
//                self.red_circle_with_slash.position = CGPoint(x: 0, y: -500)
//                self.red_circle_with_slash.scale(to: CGSize(width: 100, height: 100))
//                self.red_circle_with_slash.zPosition = 5
//                
//                self.addChild(self.red_circle_with_slash)
//
//            }
//            
//        }
        
        
        ads.position = CGPoint(x: 0, y: -475)
        ads.fontName = "Arcade"
        ads.fontSize = 50
        ads.zPosition = 4
        
        
        addChild(ads)
        
        
        
        red_circle_with_slash.position = CGPoint(x: 0, y: -450)
        red_circle_with_slash.scale(to: CGSize(width: 100, height: 100))
        red_circle_with_slash.zPosition = 5
        
        addChild(red_circle_with_slash)
        
        
        if let _ = UserDefaults.standard.value(forKey: "paid_version") {
            ads.removeFromParent()
            red_circle_with_slash.removeFromParent()
        }
        
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        if GrandPrixBackground.contains(touchLocation) {
            
            GrandPrixBackground.color = SKColor.white
            
        }
        
        if TimeTrialsBackground.contains(touchLocation) {
            
            TimeTrialsBackground.color = SKColor.white
            
        }
        
        if HowToPlayBackground.contains(touchLocation) {
            
            HowToPlayBackground.color = SKColor.white
            
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        GrandPrixBackground.color = blue
        TimeTrialsBackground.color = blue
        HowToPlayBackground.color = blue
        
        if GrandPrixBackground.contains(touchLocation) {
            //CGSize(width: 750, height: 1334)
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
            let gameScene = CupSelectionScene(size: CGSize(width: 750, height: 1334), type: "grand_prix")
            self.view?.presentScene(gameScene, transition: reveal)
        }
        
        if TimeTrialsBackground.contains(touchLocation) {
            
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
            let gameScene = CupSelectionScene(size: CGSize(width: 750, height: 1334), type: "time_trials")
            self.view?.presentScene(gameScene, transition: reveal)
        }
        
        if HowToPlayBackground.contains(touchLocation) {
            
            let reveal = SKTransition.doorsOpenVertical(withDuration: 0.25)
            let difficultyScene = Tutorial(size: self.size)
            self.view?.presentScene(difficultyScene, transition: reveal)
            
        }
        
        if red_circle_with_slash.contains(touchLocation) {
//            let AlertController = UIAlertController(title: "Bll Starting Position", message: "Please Enter a X Coordinate Value IN Range 0 to 345 ", preferredStyle: .alert)
            
            
            SwiftyStoreKit.purchaseProduct("12345", atomically: true) { result in
                switch result {
                case .success(let product):
                    print("Purchase Success: \(product.productId)")
                    
                    UserDefaults.standard.set(true, forKey: "paid_version")
                    
                    
                    self.ads.removeFromParent()
                    self.red_circle_with_slash.removeFromParent()
                    
                    self.view?.subviews.forEach({ $0.removeFromSuperview() })
                    
                case .error(let error):
                    switch error.code {
                    case .unknown: print("Unknown error. Please contact support")
                    case .clientInvalid: print("Not allowed to make the payment")
                    case .paymentCancelled: break
                    case .paymentInvalid: print("The purchase identifier was invalid")
                    case .paymentNotAllowed: print("The device is not allowed to make the payment")
                    case .storeProductNotAvailable: print("The product is not available in the current storefront")
                    case .cloudServicePermissionDenied: print("Access to cloud service information is not allowed")
                    case .cloudServiceNetworkConnectionFailed: print("Could not connect to the network")
                    }
                }
            }
            
//            SwiftyStoreKit.restorePurchases(atomically: true) { results in
//                if results.restoreFailedProducts.count > 0 {
//                    print("Restore Failed: \(results.restoreFailedProducts)")
//                }
//                else if results.restoredProducts.count > 0 {
//                    print("Restore Success: \(results.restoredProducts)")
//                }
//                else {
//                    print("Nothing to Restore")
//                }
//            }
            
            //self.viewController.present(AlertController, animated: true, completion: nil)
            
        }
        
    }
    
    
}
