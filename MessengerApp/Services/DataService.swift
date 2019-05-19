//
//  DataService.swift
//  MessengerApp
//
//  Created by Kafkas Baranseli on 20/05/2019.
//  Copyright © 2019 Baranseli. All rights reserved.
//

import Foundation
import Firebase

// 001 to have root access to DB in Firebase
let DB_BASE = Database.database().reference()

// 002 instanciate a class
class DataService {
    
    static let instance = DataService()
    
  // 003 create variables for nested DB content
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_FEED = DB_BASE.child("feed")
    
    // 004 after private variables create public variable in order to set access the information
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_GROUPS: DatabaseReference {
        return _REF_GROUPS
    }
    
    var REF_FEED: DatabaseReference {
        return _REF_FEED
    }
    
    
    // 005 create func to push users into the users feed
    func createDBUser(uid: String, userData: Dictionary <String, Any>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
}
