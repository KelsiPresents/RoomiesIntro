//
//  AuthViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 5/7/21.
//

import UIKit
import FirebaseAuth

class AuthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
     @IBAction func loginButtonPressed(_ sender: UIButton) {
        if let email = usernameTextField.text, let password = passwordTextField.text{
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
              guard let strongSelf = self else { return }
              // ...
                if let user = authResult?.user {
                    print(user.email)
                    self?.performSegue(withIdentifier: "loginSegue", sender: nil)
                }
            }
            
        }
        else{
            print("error")
        }
        
     }
    var handle: AuthStateDidChangeListenerHandle?
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            
            print(user?.email)
            
          // ...
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
