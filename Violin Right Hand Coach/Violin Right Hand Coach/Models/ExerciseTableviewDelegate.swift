//
//  ExerciseTableviewDelegate.swift
//  Violin Right Hand Coach
//
//  Created by user on 15/09/2019.
//  Copyright © 2019 Jack Young. All rights reserved.
//

import Foundation
import UIKit


//
//extension CreateSessionVC : UITableViewDelegate {
//    
//
//    
//
//    
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//
//        if segue.identifier == "beginGame" {
//            
//            let exercisesInSession = dataSource.exercises.filter {
//                $0.isExerciseSelected
//            }
//            guard !exercisesInSession.isEmpty else { return alert.noExercisesSelected(on: self)  }
//            
//            let sessionVC = segue.destination as! BeginSessionViewController
//            sessionVC.session = Session(bpm: bpm, Time: time, exercises : exercisesInSession)
//           
//        }
//        
//                 if segue.identifier == "info" {
//                    let infoVC = segue.destination as! InfoViewController
//            if let indexPath = self.tableView.indexPathForSelectedRow {
//                    infoVC.exercise = self.dataSource.exercises[indexPath.row].explanation
//            }
//        }
//        
//        if segue.identifier == "addNew" {
//            let addVC = segue.destination as! NewExerciseViewController
//            addVC.newExerciseDelegate = self
//        }
//    }
//    
//    
//    
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        let exercise = self.dataSource.exercises[indexPath.row]
//        
//        guard exercise.explanation != nil else {
//            return
//        }
//
//        
//        performSegue(withIdentifier: "info", sender: self)
//
//    }
//    
//
//    
//}
