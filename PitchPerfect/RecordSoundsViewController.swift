//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Vivin Raj on 10/05/16.
//  Copyright © 2016 Vivin Raj. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var RecordingLabel: UILabel!
    var audioRecorder:AVAudioRecorder!
    
    
    
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
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        
        
    }
    
    
    @IBAction func recordAudio(sender: AnyObject) {
        print("Recording in progress")
        RecordingLabel.text="Recording in progress"
        stopButton.enabled = true
        recordButton.enabled = false
        
        let dirPath=NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let recordingName = "recordVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
    
        let session = AVAudioSession.sharedInstance()
        try!
            session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
            
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        print("Recording Finished")
        if (flag) {
                self.performSegueWithIdentifier("stopRecording", sender: audioRecorder.url)
                }
            else {
                print("Recording not finished")
                }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "stopRecording") {
            let playSoundsVC = segue.destinationViewController as! PlaySoundsViewController
            let recordedAudioURL = sender as! NSURL
            print("recorded Audio URL done")
           // let recordedAudio
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }


}

