//
//  UserData.swift
//  Group9
//
//  Created by Jasmine Hanifa Mounir on 28/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import Foundation
import CloudKit

struct User{
    var name: String?
    var email: String?
    var password: String?
    var dob: String?
    var phone: String?
    var location: String?
    
//    init(record: CKRecord) {
//        name = record["name"]
//        email = record["email"]
//        password = record["password"]
//        dob = record["dob"]
//        phone = record["phone"]
//        location = record["location"]
//    }
    init(name: String, email: String, password: String, dob: String, phone: String, location: String) {
        self.name = name
        self.email = email
    }
}

func currentUser() -> User?{
    let status = UserDefaults.standard.string(forKey: "hasLogin") ?? "false"
    if status == "true" {
        return User(name: "Guest", email: "guest@guest.com", password: "guest", dob: "January, 17th 1995", phone: "081237758894", location: "Jakarta")
    }
    return nil
}
