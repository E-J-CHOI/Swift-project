//
//  WorldCupMainViewController.swift
//  Shamanism
//
//  Created by cscoi007 on 2019. 8. 23..
//  Copyright © 2019년 cscoi007. All rights reserved.
//

import UIKit

class WorldCupMainViewController: UIViewController {
    @IBOutlet weak var maleCelebrityButton: UIButton!
    @IBOutlet weak var femaleCelebrityButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        maleCelebrityButton.layer.cornerRadius = 14
        femaleCelebrityButton.layer.cornerRadius = 14
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let button: UIButton = sender as? UIButton else {
            return
        }
        guard let nextViewController = segue.destination as? WorldCupVSViewController else {
            return
        }
        let tag = button.tag
        
        switch tag {
        case 0:
            nextViewController.worldCupCase = "maleceleb"
        case 1:
            nextViewController.worldCupCase = "femaleceleb"
        case 2:
            nextViewController.worldCupCase = "default"
        case 3:
            nextViewController.worldCupCase = "random"
        default:
            break
        }
    }

}
