//
//  ViewController.swift
//  NewNotfications
//
//  Created by Arpita Bhatia on 2/17/17.
//  Copyright © 2017 Arpita Bhatia. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //1. request permission
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            
            if granted {
                print("notfication access granted")
            } else {
                print(error?.localizedDescription)
            }
            
        }
        
    }
    
    @IBAction func notifyButtonTapped(sender: UIButton) {
        
    }
    
    func scheduleNotification(inSeconds: TimeInterval, completion: (Success: Bool) -> ()) {
        
    }
    
    

    
}

