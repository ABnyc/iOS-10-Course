//
//  UICollectionView+Ext.swift
//  TacoPop
//
//  Created by Arpita Bhatia on 2/16/17.
//  Copyright © 2017 Arpita Bhatia. All rights reserved.
//

import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifire)
        
    }
    
    func dequesReusableCell<T:UICollectionViewCell>(forIndexPath indexPath:NSIndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifire, for: indexPath as IndexPath) as? T else {
            fatalError("Could not deque cell with identifer: \(T.reuseIdentifire)")
            
        }
        return cell
    }
    
}

extension UICollectionViewCell: ReusableView{}
