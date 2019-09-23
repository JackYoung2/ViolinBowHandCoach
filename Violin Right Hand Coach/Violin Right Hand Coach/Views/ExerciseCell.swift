//
//  ExerciseCell.swift
//  Violin Right Hand Coach
//
//  Created by user on 13/09/2019.
//  Copyright © 2019 Jack Young. All rights reserved.
//

import Foundation
import UIKit

protocol onSwitchDelegate {
    func didChangeSwitchState(cell:exerciseCell)
}

class exerciseCell : UITableViewCell {
    
    @IBOutlet weak var exerciseTitleLabel: UILabel!
    @IBOutlet weak var exerciseSwitch: UISwitch!
    
  
    
    var switchTapped : ((Bool)->Void)?
    
    var title: String? {
        didSet {
            self.exerciseTitleLabel.text = title ?? ""
        }
    }


    @IBAction func switchStateChanged(_ sender: UISwitch) {
        
        switchTapped?(sender.isOn)
    
    }
    
    
    
    
    
    
}
