//
//  User.swift
//  cricketApp-CMT
//
//  Created by Seena Shafai on 22/10/2017.
//  Copyright © 2017 Seena Shafai. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

struct User {
    
    let uid: String
    let email: String
    
    init(authData: User) {
        uid = authData.uid
        email = authData.email
    }
    
    init(uid: String, email: String) {
        self.uid = uid
        self.email = email
    }
    
}

