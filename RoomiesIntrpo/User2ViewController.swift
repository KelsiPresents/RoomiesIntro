//
//  User2ViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 4/23/21.
//

import UIKit

class User2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var advice = ""
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var adviceTextField: UITextField!
    
    @IBAction func enterClicked(_ sender: Any) {
        self.advice.append("\(adviceTextField.text!)\n")
        adviceLabel.text! = advice
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
