//
//  BioViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 3/24/21.
//

import UIKit

class BioViewController: UIViewController {

    var fullName:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var ageTextField: UITextField!
    
    
    @IBOutlet weak var gradeTextField: UITextField!
    
    @IBOutlet weak var majorTextField: UITextField!
    
    @IBOutlet weak var bioTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.destination is ProfileViewController {
            
            let pc = segue.destination as? ProfileViewController
            pc?.fill = (nameTextField.text!)
            pc?.fill2 = (ageTextField.text!)
            pc?.fill3 = (gradeTextField.text!)
            pc?.fill4 = (majorTextField.text!)
            pc?.fill5 = (bioTextField.text!)
            
            
        }
        
        
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
