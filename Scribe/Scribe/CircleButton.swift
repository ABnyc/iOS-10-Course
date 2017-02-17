//
//  CircleButton.swift
//  Scribe
//
//  Created by Arpita Bhatia on 2/16/17.
//  Copyright © 2017 Arpita Bhatia. All rights reserved.
//

import UIKit
@IBDesignable

class CircleButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 30.0 {
        didSet {
            setUpView()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        
            setUpView()
            
        }
    
    func setUpView(){
        layer.cornerRadius = cornerRadius
    }
    
}
