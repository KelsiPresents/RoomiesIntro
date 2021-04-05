//
//  LoginViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 3/16/21.
//

import UIKit

class LoginViewController: UIViewController {

    
    var personality:String = ""
    var name: String = ""
    
    
    
    @IBOutlet weak var profileBrowseView: UIImageView!
    
var imageNames = ["profile", "secondprofile", "3rdprofile"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        schoolLabel?.text = (name + ", you are a " + personality.lowercased() + " person and below are some more " + personality.lowercased() + " people, who are looking  for roomates too!")
        schoolLabel.font = UIFont.systemFont(ofSize: 30.0)
        
        headerLabel?.text = ("You are ... " + personality)
        
        let timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true){
            timer in
            self.profileBrowseView.image = UIImage(named: self.imageNames.randomElement()!)
        }
        timer.fire()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var headerLabel: UILabel!
    
   
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
