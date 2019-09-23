//
//  exercise.swift
//  Violin Right Hand Coach
//
//  Created by user on 03/09/2018.
//  Copyright © 2018 Jack Young. All rights reserved.
//

import Foundation


class Exercise {
 
  
    var title : String
    var extraInfo: String
    var explanation : explanation?
    var isExerciseSelected: Bool
    
    
    init ( title : String, ExtraInfo: String, explanation: explanation?) {
       

        self.title = title
        self.extraInfo = ExtraInfo
        self.explanation = explanation
        self.isExerciseSelected = true
    }
    
    
}
