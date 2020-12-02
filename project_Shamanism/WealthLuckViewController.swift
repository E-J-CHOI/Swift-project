//
//  WealthViewController.swift
//  FortuneSet
//
//  Created by cscoi006 on 23/08/2019.
//  Copyright © 2019 freeuser. All rights reserved.
//

import UIKit
import Foundation

class WealthViewController: UIViewController, UITextFieldDelegate {
    
    
    //    let dateFormatter = DateFormatter()
    
    //    dateFormatter.dateFormat = "YYYY-MM-dd"
    
    
    @IBOutlet var wealthTextView: UITextView!
 
    var myaDouble: Double = 0.0
    var myaInt: Int = 1
    
    var totalWealthValue: Int?
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        self.title = " 재물운 "
        // using current date and time as an example
        let someDate = Date()
        print(someDate)
        
        // convert Date to TimeInterval (typealias for Double)
        let timeInterval = someDate.timeIntervalSince1970
        myaDouble = timeInterval
        
        print(timeInterval)
        
        // convert to Integer
//        let myaInt = Int(timeInterval)
//
//        print(myaInt)
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//                wealthTextField.delegate = self
        
        
        
                let a: Int = Int(700 * sin(11211112 * myaDouble * 3.14 / 180))
        
         totalWealthValue =  10000 * a
        
        
                if let textTotal = totalWealthValue {
                    if textTotal >= 1000000000{
                        self.wealthTextView.text = "와우 당신은 평생 \(textTotal)을 벌어드립니다."
                    }else{
                
                        self.wealthTextView.text = "당신의 재물운은 \(textTotal)원 입니다."
                    }
    }
    
    
    // Do any additional setup after loading the view.
}


}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */
