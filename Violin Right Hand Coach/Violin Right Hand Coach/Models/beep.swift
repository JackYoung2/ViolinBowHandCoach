//
//  beep.swift
//  Violin Right Hand Coach
//
//  Created by user on 07/09/2018.
//  Copyright © 2018 Jack Young. All rights reserved.
//

import Foundation
import AVFoundation

class Beep {
    
    var audioPlayer: AVAudioPlayer?
    
    func playUsingAVAudioPlayer(url: URL) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print(error)
        }
    }
    
    func playBeep1() {
        guard let filePath = Bundle.main.path(forResource: "StringBeep", ofType: "wav") else {
            print("File does not exist in the bundle.")
            return
        }
        
        let url = URL(fileURLWithPath: filePath)
        
        playUsingAVAudioPlayer(url: url)
    }
    
    func playBeep2() {
        guard let filePath = Bundle.main.path(forResource: "Tone", ofType: "wav") else {
            print("File does not exist in the bundle.")
            return
        }
        
        let url = URL(fileURLWithPath: filePath)
        
        playUsingAVAudioPlayer(url: url)
    }
    
   func playA() {
    
    guard let filePath = Bundle.main.path(forResource: "Atone", ofType: "wav") else {
    print("File does not exist in the bundle.")
    return
    }
    
    let url = URL(fileURLWithPath: filePath)
    
    playUsingAVAudioPlayer(url: url)
    }
    
    
    
   
}
