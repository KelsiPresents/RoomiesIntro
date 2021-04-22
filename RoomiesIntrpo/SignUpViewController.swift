//
//  SignUpViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 3/24/21.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
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
    }
    
    
    @IBAction func onSignUpButtonPressed(_ sender: Any) {
        if passwordTextField.text == confirmPasswordTextField.text {
                 Auth.auth().createUser(withEmail: usernameTextField.text!, password: passwordTextField.text!) { authResult, error in
                        guard error == nil else { return  }
                        print(authResult)
                      }
                } else {
                    let alertController = UIAlertController(title: "Password Does Not Match", message: "Please Try Again", preferredStyle:  .alert)
                    let alertAction =   UIAlertAction(title: "Okay", style: .default, handler: nil)
                    alertController.addAction(alertAction)
                    present(alertController, animated: true, completion: nil)
                    
                }
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


