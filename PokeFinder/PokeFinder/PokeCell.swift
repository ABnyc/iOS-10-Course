//
//  PokeCell.swift
//  PokeFinder
//
//  Created by Arpita Bhatia on 2/22/17.
//  Copyright © 2017 Arpita Bhatia. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var pokeImage: UIImageView!
    @IBOutlet weak var pokeImgLbl: UILabel!
    
     //index of poke in pokmon array
    
    func configureCell(poke: String){
        var indexNumber: Int
        
        pokeImgLbl.text = poke
        //index of poke in pokemon Array
        indexNumber = pokemon.index(of: poke)!
        pokeImage.image = UIImage(named: "\(indexNumber + 1)")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
        
    }
    
}
