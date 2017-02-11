//
//  PokeCellCollectionViewCell.swift
//  PokeDex
//
//  Created by Arpita Bhatia on 2/10/17.
//  Copyright © 2017 Arpita Bhatia. All rights reserved.
//

import UIKit

class PokeCellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokemon: Pokemon!
    func configureCell(_ pokemon: Pokemon) {
        self.pokemon = pokemon
        nameLbl.text = self.pokemon.name.capitalized
        thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
        
        
    }
    
    required init?(coder aDecoder:NSCoder){
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    
}
