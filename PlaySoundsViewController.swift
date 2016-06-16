//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Vivin Raj on 15/06/16.
//  Copyright © 2016 Vivin Raj. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var recordedAudioURL: NSURL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: NSTimer!
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!


    
    
    enum ButtonType: Int{ case Slow = 0, Fast, Chipmunk, Vader, Echo, Reverb}
    
    @IBAction func playSoundForButton(sender: UIButton){
        print("Play Button Pressed")
        switch(ButtonType(rawValue: sender.tag)!) {
        case.Slow: playSound(rate: 0.5)
        case.Fast: playSound(rate: 2)
        case.Chipmunk: playSound(pitch: 1000)
        case.Vader: playSound(pitch: -1000)
        case.Echo: playSound(echo: true)
        case.Reverb: playSound(reverb: true)
            
        }
        configureUI(.Playing)
        
    }
    
    
    @IBAction func stopButtonPressed(sender: AnyObject) {
        print("Stop Button Pressed")
        stopAudio()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Play sounds loaded")
        setupAudio()
        print("Audio setup done")
    }
    
    override func viewWillAppear(animated: Bool) {
        configureUI(.NotPlaying)
    }
    
    
}
