//
//  notMemberViewController.swift
//  Shamanism
//
//  Created by cscoi007 on 2019. 8. 23..
//  Copyright © 2019년 cscoi007. All rights reserved.
//

import UIKit

class notMemberViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.isEnabled = false

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = nil
        datePicker.date = Date()
        
        cancelButton.roundEdge()
        startButton.roundEdge()
    }
    
    @IBAction func dismissModal() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        isInputValid()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        isInputValid()
        return false
    }
    
    func isInputValid() {
        guard let name = nameField.text else {
            return
        }
        if name.count > 0 {
            startButton.isEnabled = true
        } else {
            startButton.isEnabled = false
        }
    }
    
    @IBAction func start() {
        TheUser.user.name = nameField.text
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        TheUser.user.dob = dateFormatter.string(from: datePicker.date)
        TheUser.user.isMember = false
        IsMember.member.member = false
        self.performSegue(withIdentifier: "notMemberLoginSegue", sender: startButton)
    }

}
