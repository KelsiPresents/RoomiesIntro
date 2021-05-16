//
//  MatchDetailViewController.swift
//  RoomiesIntrpo
//
//  Created by Giselle Salgado on 5/14/21.
//

import UIKit

class MatchDetailViewController: UIViewController {
    var match: Match?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let match = match{
            title = match.name
            ageLabel.text = match.age
            gradeLabel.text = match.grade
            majorLabel.text = match.major
            bioLabel.text = match.bio
            collegeLabel.text = match.college
            if match.instagram != nil {
                instagramButton.isHidden = false
            } else{
                instagramButton.isHidden = true
            }
        }
        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var ageLabel: UILabel!
    
    
    @IBOutlet weak var gradeLabel: UILabel!
    
    
    @IBOutlet weak var majorLabel: UILabel!
    
    
    @IBOutlet weak var bioLabel: UILabel!
    
    @IBOutlet weak var collegeLabel: UILabel!
    
   
    @IBOutlet weak var instagramButton: UIButton!
    
    
    @IBAction func onInstagramButtonPressed(_ sender: Any) {
        if let instagram = match?.instagram {
            if let url = NSURL(string: "https://www.instagram.com/" + instagram+"/"){
                UIApplication.shared.openURL(url as URL)
                
                
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

}
