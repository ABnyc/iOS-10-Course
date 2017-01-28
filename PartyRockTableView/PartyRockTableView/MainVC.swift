//
//  ViewController.swift
//  PartyRockTableView
//
//  Created by Arpita Bhatia on 1/27/17.
//  Copyright © 2017 Arpita Bhatia. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    var partyRocksArray = [PartyRock]()
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let urlTest = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/KQ6zr6kCPj8\" frameborder=\"0\" allowfullscreen></iframe>"
        
        let p1 = PartyRock(imageURL: "http://shannonmariegd.com/wp-content/uploads/2013/03/Party-Rock-FINAL1.png", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/KQ6zr6kCPj8\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "LMFAO - Party Rock Anthem 1")
        let p2 = PartyRock(imageURL: "http://shannonmariegd.com/wp-content/uploads/2013/03/Party-Rock-FINAL1.png", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/KQ6zr6kCPj8\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "LMFAO - Party Rock Anthem 2")
        let p3 = PartyRock(imageURL: "http://shannonmariegd.com/wp-content/uploads/2013/03/Party-Rock-FINAL1.png", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/KQ6zr6kCPj8\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "LMFAO - Party Rock Anthem 3")
        let p4 = PartyRock(imageURL: "http://shannonmariegd.com/wp-content/uploads/2013/03/Party-Rock-FINAL1.png", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/KQ6zr6kCPj8\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "LMFAO - Party Rock Anthem 4")
        let p5 = PartyRock(imageURL: "http://shannonmariegd.com/wp-content/uploads/2013/03/Party-Rock-FINAL1.png", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/KQ6zr6kCPj8\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "LMFAO - Party Rock Anthem 5")
        let p6 = PartyRock(imageURL: "http://shannonmariegd.com/wp-content/uploads/2013/03/Party-Rock-FINAL1.png", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/KQ6zr6kCPj8\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "LMFAO - Party Rock Anthem 6")
        let p7 = PartyRock(imageURL: "http://shannonmariegd.com/wp-content/uploads/2013/03/Party-Rock-FINAL1.png", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/KQ6zr6kCPj8\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "LMFAO - Party Rock Anthem 7 ")
        partyRocksArray.append(p1)
        partyRocksArray.append(p2)
        partyRocksArray.append(p3)
        partyRocksArray.append(p4)
        partyRocksArray.append(p5)
        partyRocksArray.append(p6)
        partyRocksArray.append(p7)
        
        
        
       
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
    }

   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell{
            
            let partyRock = partyRocksArray[indexPath.row]
            
            cell.updateUI(partyRock: partyRock)
            
            return cell
        } else {
            return UITableViewCell()
        }
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocksArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocksArray[indexPath.row]
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }

    

}

