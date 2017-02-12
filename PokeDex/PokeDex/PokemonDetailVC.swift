//
//  PokemonDetailVC.swift
//  PokeDex
//
//  Created by Arpita Bhatia on 2/12/17.
//  Copyright © 2017 Arpita Bhatia. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!

    @IBOutlet weak var nameLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

       nameLbl.text = pokemon.name.capitalized
        
    }

    

}
