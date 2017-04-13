//
//  ViewController.swift
//  DevChat
//
//  Created by Arpita Bhatia on 3/22/17.
//  Copyright © 2017 Arpita Bhatia. All rights reserved.
//

import UIKit

class CameraVC: CameraViewController {

    @IBOutlet weak var previewView: PreviewView!
    
    override func viewDidLoad() {
        self._previewView = previewView //notice its added above super.viewDidLoad
        
        super.viewDidLoad()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

