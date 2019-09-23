//
//  helperFunctions.swift
//  Violin Right Hand Coach
//
//  Created by user on 04/09/2018.
//  Copyright © 2018 Jack Young. All rights reserved.
//

import Foundation

extension MutableCollection {
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d: Int = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            swapAt(firstUnshuffled, i)
        }
    }
}

extension Sequence {
    func shuffled() -> [Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}

func randSequence() -> String {
     let temp = ["1","2","3","4","5","6","7","8"]
    
    let shuffle = temp.shuffled()
    let finishedSequence = shuffle.joined(separator: " ")
    
    return finishedSequence
 
}


func bowSpeeds() -> String {
    var areaChooser =  ["Fast Frog, Slow Tip", "Fast Tip, Slow Frog", "Fast Frog - Slow Middle - Fast Tip", "Slow Frog - Fast Middle - Slow Tip", "Slow To Fast", "Fast To Slow"]
    
    let random = areaChooser[Int(arc4random_uniform(UInt32(areaChooser.count)))]
    return random
}

func lanes() -> String {
    var lanes = ["Lane 1", "Lane 2", "Lane 3", "Lane 4", "Lane 5"]
    let random = lanes[Int(arc4random_uniform(UInt32(lanes.count)))]
    return random
    
}

