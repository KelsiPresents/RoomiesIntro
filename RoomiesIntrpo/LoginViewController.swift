//
//  LoginViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 3/16/21.
//

import UIKit

class LoginViewController: UIViewController {

    
    var school:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        schoolLabel?.text = ("There are ??% of people at " + school + " that have those same answers ")
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var schoolLabel: UILabel!
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
