//
//  EndSessionViewController.swift
//  Violin Right Hand Coach
//
//  Created by user on 06/09/2018.
//  Copyright © 2018 Jack Young. All rights reserved.
//

import UIKit
import StoreKit

class EndSessionViewController: UIViewController {
    
    let timesRan = UserDefaults.standard.integer(forKey: "counter")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.incrementIntegerForKey(key: "counter")
        
        
        if #available( iOS 10.3,*){
            if timesRan > 4 {
            SKStoreReviewController.requestReview()
            }
        }
    }
 
    @IBAction func newSessionTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "goHome", sender: nil)
    }
    
    

}
