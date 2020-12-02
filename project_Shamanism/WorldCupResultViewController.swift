//
//  WorldCupResultViewController.swift
//  Shamanism
//
//  Created by cscoi007 on 2019. 8. 23..
//  Copyright © 2019년 cscoi007. All rights reserved.
//

import UIKit
import Foundation

class WorldCupResultViewController: UIViewController {
    
    @IBOutlet weak var nameOfWinnerLabel: UILabel!
    @IBOutlet weak var photoOfWinnerLabel: UIImageView!
    @IBOutlet weak var explainLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        photoOfWinnerLabel.roundedImage()
        
        nameOfWinnerLabel.text = CelebrityInfo.winner.name
        guard let winnerName = CelebrityInfo.winner.name, let winnerPhotoName = CelebrityInfo.winner.photoName, let name = TheUser.user.name, let userDob = TheUser.user.dob, let winnerDob = CelebrityInfo.winner.dateOfBirth else {
            return
        }
        photoOfWinnerLabel.image = UIImage(named: winnerPhotoName)
        explainLabel.text = "\(name)님과 \(winnerName)님의 궁합은"
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let dateOfUser: Date = dateFormatter.date(from: userDob)!
        let numberOfUser = Int(dateOfUser.timeIntervalSince1970.truncatingRemainder(dividingBy: 100000000))
        
        print(numberOfUser)
        
        let dateOfWinner: Date = dateFormatter.date(from: winnerDob)!
        let numberOfWinner: Int = Int(dateOfWinner.timeIntervalSince1970.truncatingRemainder(dividingBy: 100000000))
        
        let numberA = numberOfUser / 100
        let numberB = numberOfWinner / 100

        let percentage: Int = (numberA * numberB) % 100
        print(numberA, numberB, percentage)
        
        percentLabel.text = "\(percentage)%"
        
        
    }
    
    @IBAction func dismissView() {
        self.navigationController?.popToRootViewController(animated: false)
    }

}
