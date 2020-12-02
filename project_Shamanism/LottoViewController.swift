//
//  LottoViewController.swift
//  Shamanism
//
//  Created by cscoi002 on 2019. 8. 26..
//  Copyright © 2019년 koreau. All rights reserved.
//

import UIKit

class LottoViewController: UIViewController {
    @IBOutlet var recomendationButton: UIButton!
    
    @IBOutlet var firstNumber: UILabel!
    @IBOutlet var secondNumber: UILabel!
    @IBOutlet var thirdNumber: UILabel!
    @IBOutlet var fourthNumber: UILabel!
    @IBOutlet var fifthNumber: UILabel!
    @IBOutlet var sixthNumber: UILabel!
    @IBOutlet var bonusNumber: UILabel!
    
    var randomArray: [Int] = []
    
    @IBAction func isButtonPushed(_ sender: UIButton){
        
        for i in 1...45 {
            
            randomArray.append(i)
        }
        
        let randomFirstNum = Int(arc4random() % 45)//0~44사이의 난수 , 배열에 넣기 위한 값
        
        
        firstNumber.text =  "\(randomArray[randomFirstNum])"
        
        // 위에서 설정된 배열 선정== 출력
        randomArray.remove(at: randomFirstNum)// 사용한 값 배열에서 없애기
        
        let randomSecondNum = Int(arc4random() % 44)
        secondNumber.text = "\(randomArray[randomSecondNum])"
        randomArray.remove(at: randomSecondNum)
        
        let randomThirdNum = Int(arc4random() % 43)
        thirdNumber.text = "\(randomArray[randomThirdNum])"
        randomArray.remove(at: randomThirdNum)
        
        let randomFourthNum = Int(arc4random() % 42)
        fourthNumber.text = "\(randomArray[randomFourthNum])"
        randomArray.remove(at: randomFourthNum)
        
        let randomFifthNum = Int(arc4random() % 41)
        fifthNumber.text = "\(randomArray[randomFifthNum])"
        randomArray.remove(at: randomFifthNum)
        
        let randomSixthNum = Int(arc4random() % 40)
        sixthNumber.text = "\(randomArray[randomSixthNum])"
        randomArray.remove(at: randomSixthNum)
        
        let randomBonusNum = Int(arc4random() % 39)
        bonusNumber.text = "\(randomArray[randomBonusNum])"
        randomArray.removeAll()
        
        
        
        
        
        
        
        
        //        firstNumber.text  = " \(randomfirstNum)"
        //
        //        secondNumber.text = " \(randomSecondNum)"
        //        thirdNumber.text = " \(randomThirdNum)"
        //        fourthNumber.text = " \(arc4random_uniform(45))"
        //        fifthNumber.text = " \(arc4random_uniform(45))"
        //        sixthNumber.text = " \(arc4random_uniform(45))"
        //
        //        bonusNumber.text = " \(arc4random_uniform(45))"
        
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = " 로또 번호 추천 "

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
