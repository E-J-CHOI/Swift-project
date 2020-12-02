//
//  SignUpViewController.swift
//  Shamanism
//
//  Created by cscoi007 on 2019. 8. 23..
//  Copyright © 2019년 cscoi007. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func signUp() {
        UserInfo.user.userName = nameField.text
        UserInfo.user.userId = idField.text
        UserInfo.user.userPassword = passwordField.text
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        UserInfo.user.userDateOfBirth = dateFormatter.string(from: datePicker.date)
        SignUpIsValid.valid.isValid = true
        self.dismiss(animated: true, completion: nil)
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
        guard let name = nameField.text, let id = idField.text, let pw = passwordField.text else {
            return
        }
        if name.count > 0 && id.count > 0 && pw.count > 0 {
            signUpButton.isEnabled = true
        } else {
            signUpButton.isEnabled = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpButton.isEnabled = false
        
        nameField.delegate = self
        idField.delegate = self
        passwordField.delegate = self
        
        nameField.text = nil
        idField.text = nil
        passwordField.text = nil
        datePicker.date = Date()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        cancelButton.roundEdge()
        signUpButton.roundEdge()
        
    }

}
