//
//  alert.swift
//  Violin Right Hand Coach
//
//  Created by user on 14/09/2019.
//  Copyright © 2019 Jack Young. All rights reserved.
//

import Foundation
import UIKit

struct alert {
    
    private static func showBasicAlert(on vc: UIViewController, with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.view.tintColor = UIColor.black
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async { vc.present(alert, animated: true) }
    }
    
    private static func showBasicAlertWithOption(on vc: UIViewController, with title: String, message: String, alertAction: UIAlertAction, cancelAlertAction: UIAlertAction) {
       
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.view.tintColor = UIColor.black
        alert.addAction(alertAction)
        alert.addAction(cancelAlertAction)
        DispatchQueue.main.async { vc.present(alert, animated: true) }
    }
    
    static func nameMissing(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "No Name", message: "Please give the exercise a name.")
    }
    
    static func savedSuccesfully(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Exercise Saved", message: "The exercise has been stored succesfully.")
    }
    
    static func couldNotSave(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Exercise Could Not Be Saved", message: "There was a problem saving the exercise.")
    }
    
    static func noExercisesSelected(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "No Exercises Selected", message: "Please select at least one exercise")
    }
    
    static func finishSession(on vc: UIViewController) {
        
        let alertAction = UIAlertAction(title: "Finish", style: .default) { alertAction in
            if let sessionVC = vc as? BeginSessionViewController {
            sessionVC.finish()
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { alertAction in
            if let sessionVC = vc as? BeginSessionViewController {
                sessionVC.metronome.play(bpm: Double(sessionVC.tempo))
               
                sessionVC.sessionPaused()
                
                }
            }
        
        
        showBasicAlertWithOption(on: vc, with: "Confirm", message: "Are you sure you want to finish?", alertAction: alertAction, cancelAlertAction: cancelAction)
    }
    
}

