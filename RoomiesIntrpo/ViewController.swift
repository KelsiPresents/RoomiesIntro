//
//  ViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 3/16/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("goodbye")
        textField?.text = answer
       
        // Do any additional setup after loading the view.
        print("\(key)")
    }
    
    var key = ""
    var answer:String = ""
    
   
    
    @IBAction func yesForQuestionOne(_ sender: Any){
        key.append("a")
        print("\(key)")
    }
    
    @IBAction func noForQuestionOne(_ sender: Any) {
        key.append("b")
        print("\(key)")
    }
    
    
    @IBAction func dependsForQuestionOne(_ sender: Any) {
        key.append("c")
        print("\(key)")
    }
    
    
    @IBAction func beforeEightPM(_ sender: Any) {
        key.append("1")
        print("\(key)")
    }
    
    
    @IBAction func eightToTen(_ sender: Any) {
        key.append("2")
        print("\(key)")
    }
    @IBAction func tenToMidnight(_ sender: Any) {
        key.append("3")
        print("\(key)")
    }
    
    @IBAction func afterMidnight(_ sender: Any) {
        key.append("4")
        print("\(key)")
    }
    
    @IBAction func yesForQuestionThree(_ sender: Any) {
        key.append("a")
        print("\(key)")
    }
    @IBAction func dependsForQuestionThree(_ sender: Any) {
        key.append("c")
        print("\(key)")
    }
    
    @IBAction func noForQuestionThree(_ sender: Any) {
        key.append("b")
        print("\(key)")
    }
    @IBAction func yesForQuestionFour(_ sender: Any) {
        key.append("a")
        print("\(key)")
    }
    
    @IBAction func dependsForQuestionFour(_ sender: Any) {
        key.append("c")
        print("\(key)")
    }
    
    @IBAction func noForQuestionFour(_ sender: Any) {
        key.append("b")
        print("\(key)")
    }
    
    @IBOutlet weak var textField: UITextField!
    
     
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.destination is LoginViewController {
            
            let vc = segue.destination as? LoginViewController
            vc?.school = (textField?.text)!
            
        }
        
        
    }
    
    
    
    
}
