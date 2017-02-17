//
//  MainVC.swift
//  TacoPop
//
//  Created by Arpita Bhatia on 2/14/17.
//  Copyright © 2017 Arpita Bhatia. All rights reserved.
//

import UIKit

class MainVC: UIViewController, DataServiceDelegate {
    
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var ds : DataService = DataService.instance
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ds.delegate = self
        ds.loadDeliciousTacoData()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        headerView.addDropShadow()
        
        collectionView.register(TacoCell.self)

        // Do any additional setup after loading the view.
    }
    
    func deliciousTacoDataLoaded() {
        print("taco loaded")
    }

    

}

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ds.tacoArray.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TacoCell", for: indexPath) as? TacoCell {
//            cell.configureCell(taco: ds.tacoArray[indexPath.row])
//            return cell
//        }
//        
//        return UICollectionViewCell()
        
        let cell = collectionView.dequesReusableCell(forIndexPath: indexPath as NSIndexPath) as TacoCell
        cell.configureCell(taco:ds.tacoArray[indexPath.row])
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 95, height: 95)
    }
}
