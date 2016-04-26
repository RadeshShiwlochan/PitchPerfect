//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Radesh on 4/19/16.
//  Copyright © 2016 Radesh. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController {

    @IBOutlet weak var pressToRecordButton: UIButton!
    @IBOutlet weak var PressToRecordLabel: UILabel!
    @IBOutlet weak var pressToStopButton: UIButton!
    
    var audioRecorder:AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordButtonPressed(sender: UIButton) {
        print("Recording")
        pressToRecordButton.enabled = false
        pressToStopButton.enabled = true
        PressToRecordLabel.text = "Recording"
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask,true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings:[:])
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }

    @IBAction func stopButtonPressed(sender: UIButton) {
        print("Recording Stop")
        PressToRecordLabel.text = "Press to Record"
        pressToRecordButton.enabled = true
        pressToStopButton.enabled = false
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    override func viewWillAppear(animated: Bool) {
        pressToStopButton.enabled = false
        PressToRecordLabel.text = "Press to Record"
        
    }
}

