//
//  MiniQ1ViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 4/3/21.
//

import UIKit

class MiniQ1ViewController: UIViewController {
    
    var results:String = ""
    var name:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var timeButton: UIButton!
    
    
    @IBOutlet weak var moneyButton: UIButton!
    
    @IBAction func timeButtonPressed(_ sender: Any) {
        results = "1"
        timeButton.backgroundColor = UIColor.gray
    }
    
    @IBAction func moneyButtonPressed(_ sender: Any) {
        results = "0"
        moneyButton.backgroundColor = UIColor.gray
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.destination is MiniQ2ViewController {
            
            let vc = segue.destination as? MiniQ2ViewController
            vc?.result = (results)
            vc?.nm = (name)
        
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
