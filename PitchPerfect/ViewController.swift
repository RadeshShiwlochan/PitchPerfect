//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Radesh on 4/19/16.
//  Copyright © 2016 Radesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pressToRecordButton: UIButton!
    @IBOutlet weak var PressToRecordLabel: UILabel!
    @IBOutlet weak var pressToStopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
    }

    @IBAction func stopButtonPressed(sender: UIButton) {
        print("Recording Stop")
        PressToRecordLabel.text = "Press to Record"
        pressToRecordButton.enabled = true
        pressToStopButton.enabled = false
    }
    
    override func viewWillAppear(animated: Bool) {
        pressToStopButton.enabled = false
        PressToRecordLabel.text = "Press to Record"
        
    }
}

