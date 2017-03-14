//
//  DataService.swift
//  DevSlopesSocial
//
//  Created by Arpita Bhatia on 3/14/17.
//  Copyright © 2017 Arpita Bhatia. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = FIRDatabase.database().reference()

class DataService {
    static let ds = DataService()
    
    //above statment makes it a singleton ..meaning it has only one instance that can be referred from view controller 500 and the same instance from view controller 1
    
    private var _REF_BASE = DB_BASE
    private var _REF_POSTS = DB_BASE.child("posts")
    private var _REF_USERS = DB_BASE.child("users")
    
    var REF_BASE : FIRDatabaseReference {
        return _REF_BASE
    }
    var REF_POSTS : FIRDatabaseReference {
        return _REF_POSTS
    }

    var REF_USERS : FIRDatabaseReference {
        return _REF_USERS
    }
    
    func createFirebaseDBUser(uid: String, userData: Dictionary<String, String>){
        REF_USERS.child(uid).updateChildValues(userData)
    }

    
    
    
}
