//
//  User2ViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 4/23/21.
//

import UIKit

class User2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func GoogleButton(sender: AnyObject) {
        if let url = NSURL(string: "https://www.instagram.com/7olited1/"){
            UIApplication.shared.openURL(url as URL)
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
