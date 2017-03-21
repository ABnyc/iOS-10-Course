//
//  FeedVC.swift
//  DevSlopesSocial
//
//  Created by Arpita Bhatia on 3/9/17.
//  Copyright © 2017 Arpita Bhatia. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var captionField: FancyField!
    @IBOutlet weak var tableView: UITableView!
    
    var imageSelected = false
    
    
    var posts = [Post]()
    var imagePicker: UIImagePickerController!
    //static var imageCache: Cache<NSString, UIImage> = Cache() //adding static makes it global variable
    static var imageCache: NSCache<NSString, UIImage> = NSCache()
    
    @IBOutlet weak var addImage: CircleView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        
        
        DataService.ds.REF_POSTS.observe(.value, with: { (snapshot) in
            //print(snapshot.value)
            
            self.posts = []
            
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshot {
                    print("SNAP: \(snap)")
                    if let postDict = snap.value as? Dictionary<String, AnyObject>{
                        let key = snap.key
                        let post = Post(postKey: key, postData: postDict)
                        self.posts.append(post)
                    }
                }
            }
            self.tableView.reloadData()
            
        })
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return posts.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell {
            
            
            if let img = FeedVC.imageCache.object(forKey: post.imageUrl as NSString){
                cell.configureCell(post: post, img: img)
                return cell
            } else {
                cell.configureCell(post: post, img: nil)
            }
            return cell
        } else {
            return PostCell()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func signOutTapped(_ sender: Any) {
        
        let keyChainResult = KeychainWrapper.standard.remove(key: KEY_UID)
        print("AB: Id removed from keychain \(keyChainResult)")
        try! FIRAuth.auth()?.signOut()
        //delete the following as it creates strong references
        //performSegue(withIdentifier: "goToSignIn", sender: nil)
        
        //instead use this
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            addImage.image = image
            imageSelected = true
        } else {
            print("AB: A valid image wasnt selected")
        }
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func addImageTapped(_ sender: Any) {
        
        present(imagePicker, animated: true, completion: nil)
    }

    @IBAction func postBtnTapped(_ sender: Any) {
        
        guard let caption = captionField.text, caption != "" else {
            //guard statment enters here if abive conditions are not true
            print("AB: Caption must be entered")
            return
            
        }
        
        guard let img = addImage.image, imageSelected == true else {
            print("AB: An image must be selected")
            return
        }
        
        if let imgData = UIImageJPEGRepresentation(img, 0.2){
            let imgUid = NSUUID().uuidString
            let metadata = FIRStorageMetadata()
            metadata.contentType = "image/jpeg"
            
            DataService.ds.REF_POST_IMAGES.child(imgUid).put(imgData, metadata: metadata){ (metadata, error) in
                if error != nil {
                    print("AB: Unable to upload image to Firebase storage")
                } else {
                    print("AB: Successfully uploaded image to Firebase storage")
                    let downloadURL = metadata?.downloadURL()?.absoluteString
                    
                }
            
            }
        }
        
    }
   

}
