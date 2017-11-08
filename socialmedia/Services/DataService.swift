//
//  DataService.swift
//  socialmedia
//
//  Created by Royce Reynolds on 11/7/17.
//  Copyright © 2017 Royce Reynolds. All rights reserved.
//

import Foundation
import Firebase

//gets your Firebase database url
let DB_BASE = Database.database().reference()

class DataService{
    
    //syntax that creates a Singleton class. A Singleton is a single instance that can be accessed globablly.
    static let ds = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_POSTS = DB_BASE.child("posts")
    private var _REF_USERS = DB_BASE.child("users")

    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_POSTS: DatabaseReference {
        return _REF_POSTS
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    func createFirebaseDBUser(uid: String, userData: Dictionary<String, String>){
        REF_USERS.child(uid).updateChildValues(userData)
    }
}
