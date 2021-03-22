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
        
        majorTextField?.text = answer
       
        // Do any additional setup after loading the view.
        print("\(key)")
    }
    
    var key = ""
    var answer:String = ""
    
    @IBOutlet weak var femaleButton: UIButton!
    @IBAction func femaleButton(_ sender: Any) {
        femaleButton.backgroundColor = UIColor.gray
    }
    
    
    @IBOutlet weak var maleButton: UIButton!
    
    @IBAction func MaleButton(_ sender: Any) {
        maleButton.backgroundColor = UIColor.gray
    }
    
    
    
    @IBOutlet weak var nonBinaryButton: UIButton!
    
    @IBAction func nonBinaryButton(_ sender: Any) {
        nonBinaryButton.backgroundColor = UIColor.gray
    }
    
    
    
    @IBOutlet weak var otherButton: UIButton!
    
    @IBAction func otherButton(_ sender: Any) {
        otherButton.backgroundColor = UIColor.gray
    }
    
    
    
    
    @IBOutlet weak var femaleRoomate: UIButton!
    @IBAction func femaleRoomate(_ sender: Any) {
        femaleRoomate.backgroundColor = UIColor.gray
    }
    
    
    
    @IBOutlet weak var maleRoomate: UIButton!
    @IBAction func maleRoomate(_ sender: Any) {
        maleRoomate.backgroundColor = UIColor.gray
    }
    
    
    
    
    @IBOutlet weak var nonBinaryRoomate: UIButton!
    @IBAction func nonBinaryRoomate(_ sender: Any) {
        nonBinaryRoomate.backgroundColor = UIColor.gray
    }
    
    
    
    
    @IBOutlet weak var noPreferenceRoomate: UIButton!
    @IBAction func noPreferenceRoomate(_ sender: Any) {
        noPreferenceRoomate.backgroundColor = UIColor.gray
    }
    
    
    
    @IBOutlet weak var textField: UITextField!
    
     
    @IBOutlet weak var majorTextField: UITextField!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.destination is LoginViewController {
            
            let vc = segue.destination as? LoginViewController
            vc?.school = (majorTextField?.text)!
            vc?.name = (textField?.text)!
            
        }
        
        
    }
    
    
    
    
}
