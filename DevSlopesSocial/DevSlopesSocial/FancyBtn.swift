//
//  FancyBtn.swift
//  DevSlopesSocial
//
//  Created by Arpita Bhatia on 2/27/17.
//  Copyright © 2017 Arpita Bhatia. All rights reserved.
//

import UIKit

class FancyBtn: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.cornerRadius = 2.0
        
    }

}