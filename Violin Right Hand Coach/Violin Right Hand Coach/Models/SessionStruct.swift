//
//  SessionStruct.swift
//  Violin Right Hand Coach
//
//  Created by user on 26/08/2018.
//  Copyright © 2018 Jack Young. All rights reserved.
//

import Foundation


public struct Session {
    public var bpm : Int
    public var Time : Int
    public var exercises : [Exercise]

    public init (bpm: Int, Time: Int, exercises : [Exercise] ) {
        self.bpm = bpm
        self.Time = Time
        self.exercises = exercises
    }
}



