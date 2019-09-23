//
//  BeginSessionViewController.swift
//  Violin Right Hand Coach
//
//  Created by user on 26/08/2018.
//  Copyright © 2018 Jack Young. All rights reserved.
//

import UIKit



class BeginSessionViewController: UIViewController {
    @IBOutlet weak var bpmString: UILabel!
    @IBOutlet weak var countdown: UILabel!
    @IBOutlet weak var ExerciseName: UILabel!
    @IBOutlet weak var stringsLabelStackiew: UIStackView!
    @IBOutlet var stringsLabels: [UILabel]!
    @IBOutlet weak var extraInfoLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var SkipOutlet: UIButton!
    @IBOutlet weak var FinishOutlet: UIButton!
    
    @IBOutlet weak var bigStack: UIStackView!
    
    @IBOutlet weak var pauseSessionButton: UIButton!
    @IBOutlet weak var pauseMetronomeButton: UIButton!
    
    var session : Session?
    
    var countdownTimer = Timer()
    
    var totalTime = 60
    var sectionTime = 0
    var stringTime = 0
    
    var startingStringTime : Float = 0.0
    var startingSectionTime : Float = 0.0
    
    var playedString: playedString = .E
    var exercisesIndexer = 0

    var timerStarted = false
    let beep = Beep()


    
    var metronome: Metronome = {
        
        
        let highURL = Bundle.main.url(forResource: "click1", withExtension: "wav")!
        let lowURL = Bundle.main.url(forResource: "click2", withExtension: "wav")!
        return Metronome(mainClickFile: lowURL, accentedClickFile: highURL)
    }()
    var tempo = 0 {
        didSet {
            bpmString.text = String(self.tempo) + " bpm"
        }
    }
    
    
    
    
    override func viewDidLoad() {
        
        manageTimesAndBPMForSessionAndExercise()
        setUpExercise()
        startTimer()
        super.viewDidLoad()
        stringHighlighter()
        metronome.play(bpm: Double(tempo))
    }
    
    
    func manageTimesAndBPMForSessionAndExercise() {
        
        if let session = session {
            totalTime = session.Time
            tempo = session.bpm
            sectionTime = Int((totalTime / session.exercises.count))
            startingSectionTime = Float(sectionTime)
            stringTime = Int((startingSectionTime / 4))
            
        }
    }
    
    
    func setUpExercise() {

        
        if let exercise = session?.exercises[exercisesIndexer] {
        
            ExerciseName.text = exercise.title
            extraInfoLabel.text = exercise.extraInfo
            sectionTime = Int(startingSectionTime)
            stringTime = Int((startingSectionTime / 4))
           
        }
       
        
        exercisesIndexer += 1
        beep.playBeep2()

    }
    
    
  
   
    
 

    
    
    func startTimer() {
        
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        timerStarted = true
        startingStringTime = Float(stringTime)
        startingSectionTime = Float(sectionTime)
        progressBar.progress = startingStringTime
    }
    
    func endTimer() {
        countdownTimer.invalidate()
        timerStarted = false
        
    }
    
    @objc func updateTime() {
        countdown.text = "\(timeFormatted(Int(totalTime)))"
        
        if timerStarted == true {
       
        if totalTime >= 0 {
            totalTime -= 1
            sectionTime -= 1
            stringTime -= 1
           

            let floatedRemaningTimeOnString = Float(stringTime)
            let progressPercentage = 1 - ((startingStringTime - floatedRemaningTimeOnString) / startingStringTime)
        
            progressBar.progress = progressPercentage
            
//            print("total time:", totalTime, "sectionTime:", sectionTime, "string time:", stringTime)
            
            if stringTime == 0 && sectionTime > 0  && playedString != .E {
                stringHighlighter()
            }
            
            if sectionTime == 0 {
                 if exercisesIndexer <= ((session?.exercises.count)! - 1) {
                stringHighlighter()
                setUpExercise()
                }
                
                if sectionTime == 0 && stringTime < 0 {
    
                    finish()
                }
            
        
            }
            
        } else {
            endTimer()
            finish()
        }
        
        
        }
        
    }
    
    
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        let hours: Int = totalSeconds / 3600
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
  
    
    
    @IBAction func metronomeTapped(_ sender: UIButton) {
        
        if metronome.isPlaying == false {
            metronome.play(bpm: Double(tempo))
            metronome.isPlaying = true
            pauseMetronomeButton.setImage(UIImage(named: "redMetronome"), for: .normal)
        }
        
        else if metronome.isPlaying == true {
        metronome.isPlaying = false
        metronome.stop()
        pauseMetronomeButton.setImage(UIImage(named: "greyMetronome"), for: .normal)
        }
        
    }
    

    
    @IBAction func skipTapped(_ sender: Any) {

        totalTime = (totalTime - sectionTime)
        
        if exercisesIndexer <= ((session?.exercises.count)! - 1) {
            
            playedString = .E
            stringHighlighter()
            stringTime = 0
            setUpExercise()
            
            
        } else {
            finish()
        }
    }
    
    
    func sessionPaused() {
        
        
        if timerStarted == true {
            
            SkipOutlet.isHidden = true
            metronome.stop()
            timerStarted = false
            pauseSessionButton.setImage(#imageLiteral(resourceName: "Resume.png"), for: UIControl.State.normal)
        }
        else {
            
            metronome.play(bpm: Double(tempo))
            timerStarted = true
            pauseSessionButton.setImage(#imageLiteral(resourceName: "Pause.png"), for: UIControl.State.normal)
            SkipOutlet.isHidden = false
        }
        
    }
    
    @IBAction func pauseSessionTapped(_ sender: Any) {
    
        sessionPaused()
    
    }
    
    
    @IBAction func finishTapped(_ sender: Any) {
        
    if timerStarted == true {
            sessionPaused()
        }
        
        alert.finishSession(on: self)
        
    }
    
    func finish() {
        timerStarted = false
        totalTime = 0
        sectionTime = 0
        stringTime = 0
        performSegue(withIdentifier: "endSession", sender: nil)
        if metronome.isPlaying {
            metronome.stop()
        }
    }
    
    
    
    func stringHighlighter() {
        
        progressBar.progress = startingStringTime
        stringTime = Int(startingStringTime)
        
        if ExerciseName.text == "Sounding Points" {
            extraInfoLabel.text = lanes()
        }
        
        
        if ExerciseName.text == "Varying Bow Speeds" {
            extraInfoLabel.text = bowSpeeds()
        }
        
        
        switch playedString {
        case .G:
            playedString = .D
        case .D:
            playedString = .A
        case .A:
            playedString = .E
        case .E:
            playedString = .G
        }
      


         beep.playBeep1()
    
    

        
//        Hide other violin String labels, highlight correct one.
    
        for string in stringsLabels {
            if let label = string.accessibilityLabel {
                if label == self.playedString.rawValue {
                    string.isHidden = false
                } else { string.isHidden = true
                }
            }
            
        }
        
    }
    
}



    





