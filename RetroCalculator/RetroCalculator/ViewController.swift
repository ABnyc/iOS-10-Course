//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Arpita Bhatia on 1/25/17.
//  Copyright © 2017 Arpita Bhatia. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var btnSoundPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundURL = URL(fileURLWithPath: path!)
        
        do {
            try btnSoundPlayer = AVAudioPlayer(contentsOf: soundURL)
            btnSoundPlayer.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    @IBAction func numberBtnPressed(sender: UIButton) {
        
        playSound()
        
    }

    func playSound() {
        if btnSoundPlayer.isPlaying {
            btnSoundPlayer.stop()
        }
        btnSoundPlayer.play()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

