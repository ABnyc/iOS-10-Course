//
//  NibLoadableView.swift
//  TacoPop
//
//  Created by Arpita Bhatia on 2/16/17.
//  Copyright © 2017 Arpita Bhatia. All rights reserved.
//

import UIKit

protocol NibLoadableView {}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}
