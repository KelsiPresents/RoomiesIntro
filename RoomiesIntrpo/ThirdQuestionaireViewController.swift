//
//  ThirdQuestionaireViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 4/6/21.
//

import UIKit

class ThirdQuestionaireViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var yesButton: UIButton!
    @IBAction func yesButtonPressed(_ sender: Any) {
        yesButton.backgroundColor = UIColor.gray
    }
    
    @IBOutlet weak var noButton: UIButton!
    @IBAction func noButtonPressed(_ sender: Any) {
        noButton.backgroundColor = UIColor.gray
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