//
//  UIExtensions.swift
//  Shamanism
//
//  Created by cscoi007 on 2019. 8. 23..
//  Copyright © 2019년 cscoi007. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func roundedImage() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 4
    }
}

extension UIButton {
    
    func roundEdge() {
        self.layer.cornerRadius = 4
    }
}
