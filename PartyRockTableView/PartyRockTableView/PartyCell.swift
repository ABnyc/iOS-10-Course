//
//  PartyCell.swift
//  PartyRockTableView
//
//  Created by Arpita Bhatia on 1/27/17.
//  Copyright © 2017 Arpita Bhatia. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var videoPreviewImage: UIImageView!
    @IBOutlet weak var videoLabel: UILabel!
    
    
    func updateUI(partyRock: PartyRock) {
        
        videoLabel.text = partyRock.videoTitle
        
        
        //ToDO Set image from URL
        let url = URL(string: partyRock.imageURL)!
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                    
                }
            } catch  {
                
            }
        }
        
        
    }

}
