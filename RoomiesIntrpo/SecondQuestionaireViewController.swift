//
//  SecondQuestionaireViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 4/6/21.
//

import UIKit

class SecondQuestionaireViewController: UIViewController {
    
    var filling:String = ""
    var filling2:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.parent?.title = "Survey"
        self.tabBarController?.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet var instructionsLabel: UILabel!
    
    
    
    @IBAction func unwindToQuestionnaire(unwindSegue: UIStoryboardSegue){
        instructionsLabel.text = "Survey Complete!"
        nextButton.isHidden = true
        instructionsLabel.isHidden = false
        
    }
    
}


