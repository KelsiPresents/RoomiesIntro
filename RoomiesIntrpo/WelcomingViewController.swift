//
//  WelcomingViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 4/8/21.
//
import iCarousel
import UIKit
var start:String = ""

class WelcomingViewController: UIViewController  {
   
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue){
        
    }
   
 
    @IBAction func onButtonPressed(_ sender: Any) {
        start = "true"
    }
    
     
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        // Do any additional setup after loading the view.
    }
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.destination is ScrollViewController{
            
            let vc = segue.destination as? ScrollViewController
            vc?.work = (start)
        
        }
    
  
}

}
