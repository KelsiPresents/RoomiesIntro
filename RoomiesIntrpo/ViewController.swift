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
        textField.delegate = self
        
       
        // Do any additional setup after loading the view.
        print("\(key)")
    }
    
    var key = ""
    var answer:String = ""
    
 
    
    
    @IBOutlet weak var textField: UITextField!
    
     
 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.destination is MiniQ1ViewController {
            
            let vc = segue.destination as? MiniQ1ViewController
            
            vc?.name = (textField?.text)!
            
            
        }
        
        
    }
    
    
    
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // dismiss keyboard
        return true
    }
}
