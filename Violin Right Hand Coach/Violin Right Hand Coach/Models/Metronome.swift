//
//  Metronome.swift
//  Violin Right Hand Coach
//
//  Created by user on 02/09/2018.
//  Copyright © 2018 Jack Young. All rights reserved.
//

import Foundation

import UIKit
import AVFoundation


class Metronome {
    
    private let audioNode: AVAudioPlayerNode
    private let audioClick1: AVAudioFile
    private let audioClick2: AVAudioFile
    private let audioEngine: AVAudioEngine
    var isPlaying = false
    
    init (mainClickFile: URL, accentedClickFile: URL? = nil) {
        
        audioClick1 = try! AVAudioFile(forReading: mainClickFile)
        audioClick2 = try! AVAudioFile(forReading: accentedClickFile ?? mainClickFile)
        
        audioNode = AVAudioPlayerNode()
        
        audioEngine = AVAudioEngine()
        audioEngine.attach(self.audioNode)
        
        audioEngine.connect(audioNode, to: audioEngine.mainMixerNode, format: audioClick1.processingFormat)
        try! audioEngine.start()
    }
    
    private func generateBuffer(bpm: Double) -> AVAudioPCMBuffer {
        
        audioClick1.framePosition = 0
        audioClick2.framePosition = 0
        
        let beatLength = AVAudioFrameCount(audioClick1.processingFormat.sampleRate * 60 / bpm)
        let bufferMainClick = AVAudioPCMBuffer(pcmFormat: audioClick1.processingFormat,
                                               frameCapacity: beatLength)!
        try! audioClick1.read(into: bufferMainClick)
        bufferMainClick.frameLength = beatLength
        
        let bufferAccentedClick = AVAudioPCMBuffer(pcmFormat: audioClick1.processingFormat,
                                                   frameCapacity: beatLength)!
        try! audioClick2.read(into: bufferAccentedClick)
        bufferAccentedClick.frameLength = beatLength
        
        let bufferBar = AVAudioPCMBuffer(pcmFormat: audioClick1.processingFormat,
                                         frameCapacity: 4 * beatLength)!
        bufferBar.frameLength = 4 * beatLength
        
        let channelCount = Int(audioClick1.processingFormat.channelCount)
        let accentedClickArray = Array(
            UnsafeBufferPointer(start: bufferAccentedClick.floatChannelData![0],
                                count: channelCount * Int(beatLength))
        )
        let mainClickArray = Array(
            UnsafeBufferPointer(start: bufferMainClick.floatChannelData![0],
                                count: channelCount * Int(beatLength))
        )
        
        var barArray = [Float]()
        // one time for first beat
        barArray.append(contentsOf: accentedClickArray)
        // three times for regular clicks
        for _ in 1...3 {
            barArray.append(contentsOf: mainClickArray)
        }
        bufferBar.floatChannelData!.pointee.assign(from: barArray,
                                                   count: channelCount * Int(bufferBar.frameLength))
        return bufferBar
    }
    
    func play(bpm: Double) {
        
        let buffer = generateBuffer(bpm: bpm)
        
        if audioNode.isPlaying {
            audioNode.scheduleBuffer(buffer, at: nil, options: .interruptsAtLoop, completionHandler: nil)
        } else {
            self.audioNode.play()
        }
        
        self.audioNode.scheduleBuffer(buffer, at: nil, options: .loops, completionHandler: nil)
        self.isPlaying = true
    }
    
    func stop() {
        audioNode.stop()
        self.isPlaying = false
    }
    
}

