//
//  CreateSessionVC.swift
//  Violin Right Hand Coach
//
//  Created by user on 26/08/2018.
//  Copyright © 2018 Jack Young. All rights reserved.
//

import UIKit
import AVFoundation




class CreateSessionVC: UIViewController, NewExerciseDelegate {
    
    
   

    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var bpmSlider: UISlider!
    @IBOutlet weak var timeLabel: UIButton!
    @IBOutlet weak var bpmLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var bpmStack: UIStackView!
    @IBOutlet weak var bpmLabel2: UILabel!
    @IBOutlet weak var bottomstACK: UIStackView!
    @IBOutlet weak var tuningOutlet: UIButton!
    @IBOutlet weak var selectDateButton: UIButton!
    @IBOutlet weak var changeDurationButton: UIButton!
    @IBOutlet weak var beginSessionButton: UIButton!
    @IBOutlet weak var tableView: UITableView!

    
    
    let dataSource = ExerciseDataSource()
    var bpm : Int = 60
    var time : Int = 20 * 60
    let beep = Beep()
    var tapper : Int = 0
    

    
    override func viewDidLoad() {
        
        
        

        super.viewDidLoad()
        
        configureViews()
        
    }
    
    
    
    
    func configureViews() {
        
        navigationController?.navigationBar.isHidden = true
        tableView.tableFooterView = UIView()
        tableView.dataSource = dataSource
        tableView.delegate = self
        self.tableView.backgroundColor = UIColor.clear
        self.tableView.reloadData()
        bpmLabel.text = String(Int(bpmSlider.value))
        timePicker.minuteInterval = 5
       
    }
    
    func updateDataSource(exercise: Exercise) {
        self.dataSource.exercises.append(exercise)
        self.tableView.reloadData()
    }
    

    @IBAction func timePressed(_ sender: Any) {
        
        time = Int(timePicker.countDownDuration)
   
        self.timePicker.isHidden = false
        self.selectDateButton.isHidden = false
        self.bpmSlider.isHidden = true
        self.bpmLabel.isHidden = true
        self.bpmLabel2.isHidden = true
        self.bpmSlider.isHidden = true
        self.tableView.isHidden = true
        self.beginSessionButton.isHidden = true
        self.changeDurationButton.isEnabled = false
        self.changeDurationButton.alpha = 0
        bottomstACK.isHidden = true
    
        
    }
    
    @IBAction func selectTimeButtonTapped(_ sender: Any) {
    
        
        self.bpmSlider.isHidden = false
        self.bpmLabel.isHidden = false
        self.bpmLabel2.isHidden = false
        self.timePicker.isHidden = true
        self.selectDateButton.isHidden = true
        self.beginSessionButton.isHidden = false
        self.changeDurationButton.isEnabled = true
        self.changeDurationButton.alpha = 1
        bottomstACK.isHidden = false
      
        
        
        if timePicker.countDownDuration == 60.0 {
            timePicker.countDownDuration = 300.0
        }
        time = Int(timePicker.countDownDuration)
     

        
        func timeFormatted(_ totalSeconds: Int) -> String {
            let seconds: Int = totalSeconds % 60
            let minutes: Int = (totalSeconds / 60) % 60
            let hours: Int = totalSeconds / 3600
            return String(format: "%02d:%02d", hours, minutes, seconds)
        }
        
        
        
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "HH:mm"
        let strTime =  timeFormatted(Int(time))
        
        self.durationLabel.text = (strTime + " min")
       
        
        self.tableView.isHidden = false
        self.beginSessionButton.isHidden = false
       
    }
    
    
    @IBAction func SliderDragged(_ sender: UISlider) {
        
        bpmLabel.text = String(Int(bpmSlider.value))
        self.bpm = Int(bpmSlider.value)
        
    }
    
    
    
    
    @IBAction func beginTapped(_ sender: Any) {
        
            performSegue(withIdentifier: "beginGame", sender: nil)
    
       
    }
    
    
    @IBAction func aboutTapped(_ sender: Any) {
        performSegue(withIdentifier: "about", sender: nil)
    }
    
    
    @IBAction func tuneTapped(_ sender: Any) {
        
     beep.playA()

    }
    
  
    

        
}
