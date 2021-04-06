//
//  FourthQuestionaireViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 4/6/21.
//

import UIKit

class FourthQuestionaireViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var oneButton: UIButton!
    @IBAction func oneButtonPressed(_ sender: Any) {
        oneButton.isHidden = true
        oneFilled.isHidden = false
        fourButton.isHidden = false
        fourFilled.isHidden = true
        threeButton.isHidden = false
        threeFilled.isHidden = true
        twoButton.isHidden = false
        twoFilled.isHidden = true
        fiveButton.isHidden = false
        fiveFilled.isHidden = true
    }
    
    @IBOutlet weak var twoButton: UIButton!
    @IBAction func twoButtonPressed(_ sender: Any) {
        twoButton.isHidden = true
        twoFilled.isHidden = false
        fourButton.isHidden = false
        fourFilled.isHidden = true
        threeButton.isHidden = false
        threeFilled.isHidden = true
        fiveButton.isHidden = false
        fiveFilled.isHidden = true
        oneButton.isHidden = false
        oneFilled.isHidden = true
        
        
    }
    
    
    @IBOutlet weak var threeButton: UIButton!
    @IBAction func threeButtonPressed(_ sender: Any) {
        threeButton.isHidden = true
        threeFilled.isHidden = false
        fourButton.isHidden = false
        fourFilled.isHidden = true
        fiveButton.isHidden = false
        fiveFilled.isHidden = true
        twoButton.isHidden = false
        twoFilled.isHidden = true
        oneButton.isHidden = false
        oneFilled.isHidden = true
    }
    
    
    @IBOutlet weak var fourButton: UIButton!
    @IBAction func fourButtonPressed(_ sender: Any) {
        fourButton.isHidden = true
        fourFilled.isHidden = false
        fiveButton.isHidden = false
        fiveFilled.isHidden = true
        threeButton.isHidden = false
        threeFilled.isHidden = true
        twoButton.isHidden = false
        twoFilled.isHidden = true
        oneButton.isHidden = false
        oneFilled.isHidden = true
    }

    @IBOutlet weak var fiveButton: UIButton!
    @IBAction func fiveButtonPressed(_ sender: Any) {
        fiveButton.isHidden = true
        fiveFilled.isHidden = false
        fourButton.isHidden = false
        fourFilled.isHidden = true
        threeButton.isHidden = false
        threeFilled.isHidden = true
        twoButton.isHidden = false
        twoFilled.isHidden = true
        oneButton.isHidden = false
        oneFilled.isHidden = true
    }
    
    @IBOutlet weak var oneFilled: UIButton!
    
    
    
    @IBOutlet weak var twoFilled: UIButton!
    
    
    @IBOutlet weak var threeFilled: UIButton!
    
    
    @IBOutlet weak var fourFilled: UIButton!
    
    
    @IBOutlet weak var fiveFilled: UIButton!
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
