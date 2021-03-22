//
//  LoginViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 3/16/21.
//

import UIKit

class LoginViewController: UIViewController {

    
    var school:String = ""
    var name: String = ""
    
    
    @IBOutlet weak var profileBrowseView: UIImageView!
    
var imageNames = ["profile", "secondprofile", "3rdprofile"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        schoolLabel?.text = (name + ", There are ??% planning to major in " + school + " that are looking for roomates too!")
        
        let timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true){
            timer in
            self.profileBrowseView.image = UIImage(named: self.imageNames.randomElement()!)
        }
        timer.fire()
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
