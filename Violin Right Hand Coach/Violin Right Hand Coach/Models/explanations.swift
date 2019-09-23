//
//  explanations.swift
//  Violin Right Hand Coach
//
//  Created by user on 13/09/2018.
//  Copyright © 2018 Jack Young. All rights reserved.
//

import Foundation

struct explanation {
    
    var title : String = ""
    var Aim : String = ""
    var howTo : String = ""
    
    init (title: String, Aim: String, howTo: String ) {
        self.title = title
        self.Aim = Aim
        self.howTo = howTo
    }
}


let openStringsExplanation = explanation(title: "Open Strings", Aim: "Improve bow control and practice correct mechanics.", howTo: "Divide the bow evenly into 4 sections and play one beat per section (total 4 beats per bow). Aim for a long resonate sound with no bumps, without changing volume.")

let minuteBowExplanation = explanation(title: "Slow Bow", Aim: "To feel every little part of the bow.", howTo: "Playing as slowly as possible, hold one long whole bow before changing.  Try to keep the sound constant and even.")

let SoundPointsExp = explanation(title: "Sounding Points", Aim: "Improve playing at different volumes, and understand the optimum speed and weight needed for each section of the playing area.", howTo: "Divide the playing area into 5 sections, with lane 1 being at the bridge, lane 3 in the middle and lane 5 closer to the fingerboard. Play open strings in the section indicated. Play at 4, 2 or 1 beat per bow. Lower number lanes will require slower heavier bows. The section will change with each string change.")

let VaryingBowSpeedsExplantion = explanation(title: "Varying Bow Speeds", Aim: "Improve bow control when playing at different speeds.", howTo: "Play fast or slow at the indicated areas. Slow to fast means for one bow you play fast at the frog the slow at the tip. Then for the next bow, slow at the tip and fast at the frog. The targeted speeds will change with each string change."
)

let bowDistExp = explanation(title: "Bow Distribution", Aim: "Improve bow distribution and playing at different bow speeds.", howTo: "Using the metronome, play the number of beats per bow shown in the sequence before moving on to the next one. If the string changes, continue from where you were on the next string. If you reach the end of the sequence, begin again from the start.")

let tiltseXP = explanation(title: "Bow Tilts", Aim: "Improve ability to tilt the bow for a softer sound.", howTo: "While playing open strings, use the fingers to tilt the bow to face the bridge and then back again.")

let liftsExp = explanation(title: "Finger Lifts", Aim: "Improve finger control and weight distribution in the hand.", howTo: "Begin with a down bow with all four fingers on the bow. As you progress the bow, slowly release the fingers one at a time starting with the fourth finger, until at the tip, the bow is supported between the first finger and the thumb. Then on the up bow slowly add back the fingers until at the frog all four fingers are placed with the bow supported primarily by the fourth finger. Try to get a feel for the transfer of weight from the fourth finger at the frog to the first finger at the tip and make finger changes as inaudible as possible.")


