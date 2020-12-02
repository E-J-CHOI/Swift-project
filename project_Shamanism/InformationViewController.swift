//
//  InformationViewController.swift
//  Shamanism
//
//  Created by cscoi007 on 2019. 8. 23..
//  Copyright © 2019년 cscoi007. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {
    @IBOutlet weak var goRootButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        goRootButton.layer.cornerRadius = 4
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let dateString = TheUser.user.dob else { return }
        let date = dateFormatter.date(from: dateString)
        
        let labelDateFormatter: DateFormatter = DateFormatter()
        labelDateFormatter.dateFormat = "yyyy년 MM월 dd일"
        
        guard let tempDate = date else { return }
        let labelDate = labelDateFormatter.string(from: tempDate)
        
        dobLabel.text = labelDate
        
        if IsMember.member.member {
            nameLabel.text = TheUser.user.name
            idLabel.isEnabled = true
            idLabel.text = TheUser.user.id
            
        }
        else {
            nameLabel.text = TheUser.user.name
            idLabel.text = "회원이 아닙니다."
            idLabel.isEnabled = false
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goRoot() {
        let alert = UIAlertController(title: "홈 화면으로 돌아갑니다.", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
            if !TheUser.user.isMember {
            self.view.window?.rootViewController?.dismiss(animated: false, completion: nil)
            } else {
            self.navigationController?.popToRootViewController(animated: false)
            }
        }
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
