//
//  TacoCell.swift
//  TacoPop
//
//  Created by Arpita Bhatia on 2/16/17.
//  Copyright © 2017 Arpita Bhatia. All rights reserved.
//

import UIKit

class TacoCell: UICollectionViewCell, NibLoadableView {

    @IBOutlet weak var tacoImage: UIImageView!
    @IBOutlet weak var tacoLabel: UILabel!
    
    var taco: Taco!
    
    func configureCell(taco: Taco) {
        self.taco = taco
        tacoLabel.text = taco.productName
        tacoImage.image = UIImage(named: taco.proteinId.rawValue)
    
    }
    
}
