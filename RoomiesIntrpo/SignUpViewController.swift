//
//  SignUpViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 3/24/21.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int ) -> String?{
            return pickerData[row]
        }
    

    @IBOutlet weak var genderPickerView: UIPickerView!
    
    var pickerData:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.genderPickerView.delegate = self
        self.genderPickerView.dataSource = self
        
        pickerData = ["Female","Male","Non-binary","other"]
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
    }
    
    
    @IBAction func onSignUpButtonPressed(_ sender: Any) {
        if passwordTextField.text == confirmPasswordTextField.text {
                 Auth.auth().createUser(withEmail: usernameTextField.text!, password: passwordTextField.text!) { authResult, error in
                        guard error == nil else { return  }
                    print(authResult.debugDescription)
                      }
                } else {
                    let alertController = UIAlertController(title: "Password Does Not Match", message: "Please Try Again", preferredStyle:  .alert)
                    let alertAction =   UIAlertAction(title: "Okay", style: .default, handler: nil)
                    alertController.addAction(alertAction)
                    present(alertController, animated: true, completion: nil)
                    
                }
            }
    
    @IBAction func eulaPressed(_ sender: Any) {
        
        if let url = NSURL(string: "https://www.eccchicago.org/eula.html"){
            UIApplication.shared.openURL(url as URL)
            
            
    }
    }

    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           textField.resignFirstResponder() // dismiss keyboard
           return true
       }

    }


//extension ViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder() // dismiss keyboard
//        return true
//    }
//}

    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


