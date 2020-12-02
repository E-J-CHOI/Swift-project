//
//  WorldCupVSViewController.swift
//  Shamanism
//
//  Created by cscoi007 on 2019. 8. 23..
//  Copyright © 2019년 cscoi007. All rights reserved.
//

import UIKit

class WorldCupVSViewController: UIViewController {
    
    var worldCupCase: String?
    var celebrityData: [CelebrityInfo] = []
    var celebrities: [CelebrityInfo] = []
    
    var currentIndex: Int = 0
    var currentGang: Int = 16
    
    @IBOutlet var leftImageView: UIImageView!
    @IBOutlet var rightImageView: UIImageView!
    @IBOutlet var gangNumberLabel: UILabel!
    @IBOutlet var leftoverNumberLabel: UILabel!
    @IBOutlet var leftGroupName: UILabel!
    @IBOutlet var rightGroupName: UILabel!
    
    @IBAction func selectLeftImage(_ sender: UITapGestureRecognizer) {
        celebrities[currentIndex] = celebrities[currentIndex * 2]
        currentIndex += 1

        if currentIndex >= currentGang / 2 {
            currentIndex = 0
            currentGang /= 2

            if currentGang == 1 {
                CelebrityInfo.winner = celebrities[0]
                self.performSegue(withIdentifier: "showResult", sender: leftImageView)
            }

            guard let leftImage = celebrities[currentIndex].photoName,
                let rightImage = celebrities[currentIndex + 1].photoName,
                let leftGroup = celebrities[currentIndex].name,
                let rightGroup = celebrities[currentIndex + 1].name else{
                    return
            }

            self.rightImageView?.alpha = 0.0
            self.rightGroupName?.alpha = 0.0

            leftImageView.image = UIImage(named: leftImage)
            leftGroupName.text = leftGroup

            rightImageView.image = UIImage(named: rightImage)
            rightGroupName.text = rightGroup

            UIView.animate(withDuration: 0.5){
                self.rightImageView?.alpha = 1.0
                self.rightGroupName?.alpha = 1.0
            }

        } else {
            guard let leftImage = celebrities[currentIndex * 2].photoName,
                let rightImage = celebrities[currentIndex * 2 + 1].photoName,
                let leftGroup = celebrities[currentIndex * 2].name,
                let rightGroup = celebrities[currentIndex * 2 + 1].name else{
                    return
            }

            self.rightImageView?.alpha = 0.0
            self.rightGroupName?.alpha = 0.0

            leftImageView.image = UIImage(named: leftImage)
            leftGroupName.text = leftGroup

            rightImageView.image = UIImage(named: rightImage)
            rightGroupName.text = rightGroup

            UIView.animate(withDuration: 0.5){
                self.rightImageView?.alpha = 1.0
                self.rightGroupName?.alpha = 1.0
            }

        }

        if currentGang == 2 {
            gangNumberLabel.text = "결승"
        } else {
            gangNumberLabel.text = "\(currentGang)강"
        }
        leftoverNumberLabel.text = "\(currentIndex + 1) / \(currentGang / 2)"
    }

    @IBAction func selectRightImage(_ sender: UITapGestureRecognizer) {
        celebrities[currentIndex] = celebrities[currentIndex * 2 + 1]
        currentIndex += 1

        if currentIndex >= currentGang / 2 {
            currentIndex = 0
            currentGang /= 2

            if currentGang == 1 {
                CelebrityInfo.winner = celebrities[0]
                self.performSegue(withIdentifier: "showResult", sender: rightImageView)
            }

            guard let leftImage = celebrities[currentIndex].photoName,
                let rightImage = celebrities[currentIndex + 1].photoName,
                let leftGroup = celebrities[currentIndex].name,
                let rightGroup = celebrities[currentIndex + 1].name else{
                    return
            }

            self.leftImageView?.alpha = 0.0
            self.leftGroupName?.alpha = 0.0

            leftImageView.image = UIImage(named: leftImage)
            leftGroupName.text = leftGroup

            rightImageView.image = UIImage(named: rightImage)
            rightGroupName.text = rightGroup

            UIView.animate(withDuration: 0.5){
                self.leftImageView?.alpha = 1.0
                self.leftGroupName?.alpha = 1.0
            }

        } else {
            guard let leftImage = celebrities[currentIndex * 2].photoName,
                let rightImage = celebrities[currentIndex * 2 + 1].photoName,
                let leftGroup = celebrities[currentIndex * 2].name,
                let rightGroup = celebrities[currentIndex * 2 + 1].name else{
                    return
            }

            self.leftImageView?.alpha = 0.0
            self.leftGroupName?.alpha = 0.0

            leftImageView.image = UIImage(named: leftImage)
            leftGroupName.text = leftGroup

            rightImageView.image = UIImage(named: rightImage)
            rightGroupName.text = rightGroup

            UIView.animate(withDuration: 0.5){
                self.leftImageView?.alpha = 1.0
                self.leftGroupName?.alpha = 1.0
            }

        }

        if currentGang == 2 {
            gangNumberLabel.text = "결승"
        } else {
            gangNumberLabel.text = "\(currentGang)강"
        }
        leftoverNumberLabel.text = "\(currentIndex + 1) / \(currentGang / 2)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let decoder: JSONDecoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let identifier = worldCupCase else {
            return
        }
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: identifier) else {
            print("data asset 가져올 수 없음")
            return
        }
        
        let jsonData: Data = dataAsset.data
        
        do {
            celebrityData = try decoder.decode([CelebrityInfo].self, from: jsonData)
        } catch {
            print("json 디코딩 실패 ", error.localizedDescription)
        }
        
        print("연예인 \(celebrityData.count)명 불러옴")
        
        var randomVariable = Int(arc4random()%32)
        
        
        for _ in 0..<currentGang {
            celebrities.append(celebrityData[randomVariable])

            randomVariable += 3
            if randomVariable >= currentGang {
                randomVariable = randomVariable - currentGang
            }
        }
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let leftImage = UIImage(named: celebrities[0].photoName!)
        let rightImage = UIImage(named: celebrities[1].photoName!)
        
        leftImageView.image = leftImage
        leftGroupName.text = celebrities[0].name!
        rightImageView.image = rightImage
        rightGroupName.text = celebrities[1].name!
        
        gangNumberLabel.text = "\(currentGang)강"
        leftoverNumberLabel.text = "\(currentIndex + 1) / \(currentGang / 2)"
        
    }
    
    @IBAction func dismissView() {
        navigationController?.popViewController(animated: true)
    }

}
