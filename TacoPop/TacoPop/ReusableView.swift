//
//  ReusableView.swift
//  TacoPop
//
//  Created by Arpita Bhatia on 2/16/17.
//  Copyright © 2017 Arpita Bhatia. All rights reserved.
//

import UIKit

protocol ReusableView: class {}

extension ReusableView where Self: UIView {
    static var reuseIdentifire: String {
        return String(describing: self)
    }
}
