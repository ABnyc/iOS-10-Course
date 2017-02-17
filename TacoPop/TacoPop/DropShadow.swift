//
//  DropShadow.swift
//  TacoPop
//
//  Created by Arpita Bhatia on 2/14/17.
//  Copyright © 2017 Arpita Bhatia. All rights reserved.
//

import UIKit

protocol DropShadow {}

extension DropShadow where Self:UIView {
    func addDropShadow(){
        //implementation
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 5
    }
}
