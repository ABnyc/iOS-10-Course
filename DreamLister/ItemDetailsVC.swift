//
//  ItemDetailsVC.swift
//  DreamLister
//
//  Created by Arpita Bhatia on 1/31/17.
//  Copyright © 2017 Arpita Bhatia. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var priceField: CustomTextField!
    @IBOutlet weak var detailsField: CustomTextField!
    @IBOutlet weak var itemTypeField: CustomTextField!
    
    
    var stores = [Store]()
    var itemToEdit: Item?
    var imagePicker: UIImagePickerController!
    
      @IBOutlet weak var thumbImage: UIImageView!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let topItem =  self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        storePicker.delegate = self
        storePicker.dataSource = self
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
       // imagePicker.allowsEditing = true //line added to get rid of the "[Generic] Creating an image format with an unknown type is an error" error when adding/editing images
        
//        
//        let store = Store(context: context)
//        store.name = "Best Buy"
//        let store2 = Store(context: context)
//        store2.name = "Target"
//        let store3 = Store(context: context)
//        store3.name = "Amazon"
//        let store4 = Store(context: context)
//        store4.name = "Tesla Dealership"
//        let store5 = Store(context: context)
//        store5.name = "Apple"
//        
//        ad.saveContext()
//        
        getStores()
        if itemToEdit != nil {
            loadItemData()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let store = stores[row]
        return store.name
        
        
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //<#code#>
    }
    
    func getStores(){
        
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        do {
            self.stores = try context.fetch(fetchRequest)
            self.storePicker.reloadAllComponents()
        } catch {
            
        }
        
        
    }
    
    @IBAction func saveBtnPressed(_ sender: Any) {
        let item: Item!
        let itemType = ItemType(context: context)
        
        let picture = Image(context: context)
        
        
        
        
        if itemToEdit == nil {
            item = Item(context: context)
        } else {
            item = itemToEdit
        }
        
        picture.image = thumbImage.image
        
        item.toImage = picture
        
        itemType.type = itemTypeField.text
        item.toItemType = itemType
        
        
        if let title = titleField.text {
            item.title = title
        }
        if let price = priceField.text {
            item.price = (price as NSString).doubleValue
        }
        if let details = detailsField.text {
            item.details = details
        }
        
        
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)]
        
        ad.saveContext()
        
       _ = navigationController?.popViewController(animated: true)
        
        
        
    }
    
    func loadItemData(){
        
        if let item = itemToEdit {
            titleField.text = item.title
            priceField.text =  "\(item.price)"
            detailsField.text = item.details
            itemTypeField.text = item.toItemType?.type
            
            
            
            thumbImage.image = item.toImage?.image as? UIImage
            
            
            if let store = item.toStore {
                var index = 0
                repeat {
                    let s = stores[index]
                    if s.name == store.name {
                        storePicker.selectRow(index, inComponent: 0, animated: false)
                        break
                    }
                    index += 1
                    
                } while (index < stores.count)
            }
            
        }
        
    }
    
    @IBAction func deletePressed(_ sender: Any) {
        
        if itemToEdit != nil {
            context.delete(itemToEdit!)
            ad.saveContext()
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func addImageBtn(_ sender: UIButton) {
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
            thumbImage.image = img
            
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
  
    
    
    
    
    
}
