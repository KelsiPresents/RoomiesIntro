//
//  RoommateViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 5/7/21.
//

import UIKit

class RoommateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func resourceOnePressed(_ sender: Any) {
        
        if let url = NSURL(string: "https://bigfuture.collegeboard.org/find-colleges/campus-life/college-roommates-the-basics"){
            UIApplication.shared.openURL(url as URL)
            
            
    }
    }
    
    
    @IBAction func resourceTwoPressed(_ sender: Any) {
        
        if let url = NSURL(string: "https://www.collegedata.com/resources/campus-life/4-things-to-remember-when-searching-for-a-college-roommate"){
            UIApplication.shared.openURL(url as URL)
            
            
    }
    }
    
    @IBAction func resourceThreePressed(_ sender: Any) {
        
        if let url = NSURL(string: "https://www.thoughtco.com/getting-along-with-college-roommate-tips-793353"){
            UIApplication.shared.openURL(url as URL)
            
            
    }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.parent?.title = "Roommate Resources"
        self.tabBarController?.navigationItem.setHidesBackButton(true, animated: false)
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
