//
//  IncrementExtension.swift
//  Violin Right Hand Coach
//
//  Created by user on 18/09/2019.
//  Copyright © 2019 Jack Young. All rights reserved.
//

import Foundation

extension UserDefaults {
    class func incrementIntegerForKey(key:String) {
        let defaults = standard
        let int = defaults.integer(forKey: key)
        defaults.set(int+1, forKey:key)
    }
}
