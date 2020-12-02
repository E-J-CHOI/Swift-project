//
//  ViewController.swift
//  Shamanism
//
//  Created by cscoi007 on 2019. 8. 23..
//  Copyright © 2019년 cscoi007. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var inputIDField: UITextField!
    @IBOutlet weak var inputPasswordField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    
    
    var database: DatabaseReference!
    var userInfo: [String:[String:String]]! = [:]
    var databaseHandler: DatabaseHandle!
    let databaseName: String = "userInformation"
    
    func configureDatabase() {
        database = Database.database().reference()
        databaseHandler = database.child(databaseName).observe(.value, with: {(snapshot) -> Void in
            guard let info = snapshot.value as? [String:[String:String]] else {
                return
            }
            self.userInfo = info
            
            print("새로운 유저가 추가되었습니다")
            print("총 개수 \(self.userInfo.count)")
        })
    }
    
    func addNewUser(name: String, id: String, password: String, dateOfBirth: String) {
        let newUser: [String:String]
        newUser = ["name": name,
                   "id":id,
                   "password":password, "dateOfBirth":dateOfBirth]
        
        database.child(databaseName).childByAutoId().setValue(newUser)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputIDField.delegate = self
        inputPasswordField.delegate = self
        
        configureDatabase()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        logInButton.roundEdge()
        
        view.endEditing(true)
        inputIDField.text = nil
        inputPasswordField.text = nil
        
        if SignUpIsValid.valid.isValid == true {
            if let name = UserInfo.user.userName, let id = UserInfo.user.userId,
                let password = UserInfo.user.userPassword,
                let dob = UserInfo.user.userDateOfBirth {
                addNewUser(name: name, id: id, password: password, dateOfBirth: dob)
            }
            UserInfo.user.userName = nil
            UserInfo.user.userId = nil
            UserInfo.user.userPassword = nil
            UserInfo.user.userDateOfBirth = nil
            
            TheUser.user.dob = nil
            TheUser.user.name = nil
            TheUser.user.isMember = false
            TheUser.user.id = nil
            TheUser.user.password = nil
            
            SignUpIsValid.valid.isValid = false
        }
    }
    
    func login() -> Bool {
        let userArray = Array(self.userInfo)
        guard let inputId = inputIDField.text, let inputPw = inputPasswordField.text else {
            return false
        }
        for index in 0..<userArray.count {
            if userArray[index].value["id"] == inputId && userArray[index].value["password"] == inputPw {
                TheUser.user.name = userArray[index].value["name"]
                TheUser.user.dob = userArray[index].value["dateOfBirth"]
                TheUser.user.isMember = true
                TheUser.user.id = userArray[index].value["id"]
                TheUser.user.password = userArray[index].value["password"]
                return true
            }
        }
        return false
    }
    
    @IBAction func isLogInButtonTouched() {
        let loginResult = login()
        if !loginResult {
            let alert = UIAlertController(title: "로그인 오류", message: "아이디 또는 비밀번호가 올바르지 않습니다.", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        } else {
            IsMember.member.member = true
            self.performSegue(withIdentifier: "successfulLoginSegue", sender: logInButton)
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }


}


