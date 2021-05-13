//
//  SignOutViewController.swift
//  RoomiesIntrpo
//
//  Created by admin on 5/12/21.
//

import UIKit
import Firebase


class SignOutViewController: UIViewController, UIApplicationDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signOutButton(_ sender: Any) {
        let auth = Auth.auth()
        
        do{
            try auth.signOut()
        } catch let signOutError {
            let alertController = UIAlertController(title: "Error", message: signOutError.localizedDescription, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
            
        }
        performSegue(withIdentifier: "unwindSegue", sender: self)
        print("Sign Out")
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
