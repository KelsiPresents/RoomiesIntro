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
    
    @IBOutlet weak var bradleyButton: UIButton!
    
  
    @IBOutlet weak var iitButton: UIButton!
    
    @IBOutlet weak var northEasternButton: UIButton!
    
    @IBAction func dropDownMenu(_ sender: Any) {
        bradleyButton.isHidden = false
        michButton.isHidden = false
        iitButton.isHidden = false
        northEasternButton.isHidden = false
    }
    
    @IBOutlet weak var michButton: UIButton!
    var college:String = ""
    
    @IBAction func michGray(_ sender: Any) {
        michButton.backgroundColor = UIColor.gray
         college = "the University of Michigan"
    }
    @IBAction func iitGray(_ sender: Any) {
        iitButton.backgroundColor = UIColor.gray
        college = "the Illinois Institute of Technology"
    }
    @IBAction func bradleyGray(_ sender: Any) {
        bradleyButton.backgroundColor = UIColor.gray
        college = "Bradley University"
    }
    @IBAction func northEasternGray(_ sender: Any) {
        northEasternButton.backgroundColor = UIColor.gray
        college = "Northeastern University"
    }
    
    
    @IBOutlet weak var textField: UITextField!
    
     
    
    @IBOutlet weak var majorTextField: UITextField!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.destination is MiniQ1ViewController {
            
            let vc = segue.destination as? MiniQ1ViewController
            
            vc?.name = (textField?.text)!
            
            
        }
        
        
    }
    
    
    
    
}
