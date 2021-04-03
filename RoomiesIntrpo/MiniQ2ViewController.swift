//
//  MiniQ2ViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 4/3/21.
//

import UIKit

class MiniQ2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var redButton: UIButton!
    
  
    @IBOutlet weak var orangeButton: UIButton!
    
    @IBOutlet weak var yellowButton: UIButton!
  
    
    @IBAction func dropDownMenu(_ sender: Any) {
        blueButton.isHidden = false
        purpleButton.isHidden = false
        pinkButton.isHidden = false
        redButton.isHidden = false
        orangeButton.isHidden = false
        yellowButton.isHidden = false
        greenButton.isHidden = false
    }
    
    @IBOutlet weak var greenButton: UIButton!
    
    @IBOutlet weak var blueButton: UIButton!
    
    
    @IBOutlet weak var purpleButton: UIButton!
    
    @IBOutlet weak var pinkButton: UIButton!

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
