//
//  NewExerciseViewController.swift
//  Violin Right Hand Coach
//
//  Created by user on 14/09/2019.
//  Copyright © 2019 Jack Young. All rights reserved.
//

import UIKit
//import CoreData
//
//protocol NewExerciseDelegate {
//    func updateDataSource(exercise: Exercise)
//}
//
//class NewExerciseViewController: UIViewController {
//    
//    @IBOutlet weak var nameTextField: UITextField!
//    @IBOutlet weak var infoTextField: UITextField!
//    
//    var newExerciseDelegate: NewExerciseDelegate?
//    
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//   setUpNavBar()
//        
//    }
//    
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        self.navigationController?.navigationBar.isHidden = true
//    }
//    
//    func setUpNavBar() {
//        let bar:UINavigationBar! =  self.navigationController?.navigationBar
//        
//        bar.isHidden = false
//        bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        bar.shadowImage = UIImage()
//        bar.alpha = 1
//    }
//    
//
//    @IBAction func save(_ sender: Any) {
//        
//        guard let exerciseName = nameTextField.text, !exerciseName.isEmpty else {
//            alert.nameMissing(on: self)
//            return }
//    
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context = appDelegate.persistentContainer.viewContext
//        
//        let entity = NSEntityDescription.entity(forEntityName: "CoreExercise", in: context)
//        let newExercise = NSManagedObject(entity: entity!, insertInto: context)
//        
//        newExercise.setValue(exerciseName, forKey: "name")
//        newExercise.setValue(infoTextField.text ?? "", forKey: "info")
//        
//        let exercise = Exercise(title: exerciseName, ExtraInfo: infoTextField.text ?? "" , explanation: nil)
//        
//        newExerciseDelegate?.updateDataSource(exercise: exercise)
//        
//        do {
//            try context.save()
//            alert.savedSuccesfully(on: self)
//        } catch {
//            print("Failed saving")
//            alert.couldNotSave(on: self)
//        }
//        
//
//        
//        
//        
//        
//    }
//    
//}
