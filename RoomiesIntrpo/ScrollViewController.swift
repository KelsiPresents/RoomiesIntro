//
//  ScrollViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 3/25/21.
//

import UIKit

class ScrollViewController: UIViewController, UIScrollViewDelegate {
    
    // Connect a UIImageView to the outlet below
    @IBOutlet weak var BrowseView: UIImageView!
    
var imageNames = ["Smaug", "Spyro", "Trogdor"]
    var i=Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        // Do any additional setup after loading the view.
    }
}
