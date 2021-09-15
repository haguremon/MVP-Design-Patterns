//
//  User.swift
//  MVP  Design Patterns
//
//  Created by IwasakIYuta on 2021/09/12.
//

import Foundation

enum Gender: String {
    case male
    case female
    case other
    

    
    
}


struct User {
    var name: String
    var email: String
    var password: String
    var gender: Gender
    var gendertype: String
}
