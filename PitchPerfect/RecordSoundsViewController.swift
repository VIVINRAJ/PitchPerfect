//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Vivin Raj on 10/05/16.
//  Copyright © 2016 Vivin Raj. All rights reserved.
//

import UIKit

class RecordSoundsViewController: UIViewController {
    
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var RecordingLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did Load")
        stopButton.enabled = false
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func stopRecording(sender: AnyObject) {
        stopButton.enabled = false
        recordButton.enabled = true
        RecordingLabel.text = "Tap to record"
        
    }
    
    
    @IBAction func recordAudio(sender: AnyObject) {
        print("Recording in progress")
        RecordingLabel.text="Recording in progress"
        stopButton.enabled = true
        recordButton.enabled = false
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

