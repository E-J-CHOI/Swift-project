//
//  CelebrityInfo.swift
//  Shamanism
//
//  Created by cscoi007 on 2019. 8. 23..
//  Copyright © 2019년 cscoi007. All rights reserved.
//

import UIKit

class CelebrityInfo: NSObject, Codable {
    static var winner: CelebrityInfo = CelebrityInfo()
    
    var name: String?
    var dateOfBirth: String?
    var photoName: String?

}
