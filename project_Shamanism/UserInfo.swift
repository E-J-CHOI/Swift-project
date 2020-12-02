//
//  UserInfo.swift
//  Shamanism
//
//  Created by cscoi007 on 2019. 8. 23..
//  Copyright © 2019년 cscoi007. All rights reserved.
//

import UIKit

class UserInfo {
    static var user: UserInfo = UserInfo()
    
    var userName: String?
    var userId: String?
    var userPassword: String?
    var userDateOfBirth: String?

}

class SignUpIsValid {
    static var valid: SignUpIsValid = SignUpIsValid()
    
    var isValid: Bool = false
}

class IsMember {
    static var member: IsMember = IsMember()
    
    var member: Bool = false
}

class TheUser {
    static var user: TheUser = TheUser()
    
    var name: String?
    var dob: String?
    var id: String?
    var password: String?
    var isMember: Bool = false
}
