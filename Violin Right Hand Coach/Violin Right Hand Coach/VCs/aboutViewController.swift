//
//  aboutViewController.swift
//  Violin Right Hand Coach
//
//  Created by user on 12/09/2018.
//  Copyright © 2018 Jack Young. All rights reserved.
//

import UIKit

class aboutViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    
    
    override func viewDidLoad() {

     
    super.viewDidLoad()

        let bar:UINavigationBar! =  self.navigationController?.navigationBar
        self.title = "About"
        bar.isHidden = false
        bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        bar.shadowImage = UIImage()
        bar.alpha = 1
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }



    

 
}
