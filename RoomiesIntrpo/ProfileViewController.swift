//
//  ProfileViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 3/24/21.
//

import UIKit

class ProfileViewController: UIViewController {
    var fill:String = ""
    var fill2:String = ""
    var fill3:String = ""
    var fill4:String = ""
    var fill5:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "\(fill)"
        ageLabel.text = "\(fill2)"
        gradeLabel.text = "\(fill3)"
        majorLabel.text = "\(fill4)"
        bioLabel.text = "\(fill5)"
        // Do any additional setup after loading the view.
    }
    
   
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var gradeLabel: UILabel!
    
    @IBOutlet weak var majorLabel: UILabel!
    
    
    @IBOutlet weak var bioLabel: UILabel!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
