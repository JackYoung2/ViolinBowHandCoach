//
//  ExerciseDataSource.swift
//  Violin Right Hand Coach
//
//  Created by user on 13/09/2019.
//  Copyright © 2019 Jack Young. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ExerciseDataSource: NSObject {
    
    
    
    
    var exercises : [Exercise] = [
        Exercise(title: "Open Strings", ExtraInfo: "4 Beats Per Bow", explanation: openStringsExplanation),
                 Exercise(title: "Slow Bow", ExtraInfo: "Long Slow Bow", explanation: minuteBowExplanation),
                 Exercise(title: "Sounding Points", ExtraInfo: lanes(), explanation: SoundPointsExp),
                 Exercise(title: "Varying Bow Speeds", ExtraInfo: bowSpeeds(), explanation: VaryingBowSpeedsExplantion),
                 Exercise(title: "Bow Distribution", ExtraInfo: randSequence(), explanation: bowDistExp),
                Exercise(title: "Tilting", ExtraInfo: "Edge - Middle - Edge", explanation: tiltseXP),
                 Exercise(title: "Finger Lifts", ExtraInfo: "Fingers off at tip, on at frog", explanation: liftsExp),
    ]
    
    override init() {
       
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CoreExercise")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            
        
            for data in result as! [NSManagedObject] {

                let newExercise = Exercise(title: data.value(forKey: "name") as! String, ExtraInfo: data.value(forKey: "info") as! String, explanation: nil)
                self.exercises.append(newExercise)
            }
            
            
            
        } catch {
            
            print("Failed")
        }
    }
    
   
}

extension ExerciseDataSource : UITableViewDataSource {

    
    
  

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let exercise = exercises[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: exerciseCell.self), for: indexPath) as! exerciseCell
        
        cell.title = exercise.title
        cell.exerciseSwitch.isOn = exercise.isExerciseSelected
        
        if exercise.explanation == nil {
            cell.selectionStyle = .none
        }
        
      
        cell.switchTapped = {
            (isOn) in
            self.exercises[indexPath.row].isExerciseSelected = isOn
        }
        
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        guard indexPath.row > 5 else {return false}
        return true
    }
   
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CoreExercise")
            request.predicate = NSPredicate(format: "name = %@", self.exercises[indexPath.row].title)
            
            let result = try? context.fetch(request)
            let resultData = result as! [NSManagedObject]
            
            for object in resultData {
                context.delete(object)
            }
            
            do {
                try context.save()
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            }

            self.exercises.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.none)
            
        }
    }
    
    
    
}

