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
        }
        // Do any additional setup after loading the view.
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
