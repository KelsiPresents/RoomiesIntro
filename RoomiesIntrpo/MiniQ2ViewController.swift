//
//  MiniQ2ViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 4/3/21.
//

import UIKit

class MiniQ2ViewController: UIViewController {
    
    var result:String = ""
    var nm:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var redButton: UIButton!
    
  
    @IBOutlet weak var orangeButton: UIButton!
    
    @IBOutlet weak var yellowButton: UIButton!
  
    
    @IBAction func dropDownMenu(_ sender: Any) {
        blueButton.isHidden = false
        purpleButton.isHidden = false
        pinkButton.isHidden = false
        redButton.isHidden = false
        orangeButton.isHidden = false
        yellowButton.isHidden = false
        greenButton.isHidden = false
        print(result)
    }
    
    @IBOutlet weak var greenButton: UIButton!
    
    @IBOutlet weak var blueButton: UIButton!
    
    
    @IBOutlet weak var purpleButton: UIButton!
    
    @IBOutlet weak var pinkButton: UIButton!
    
    
    
    

    
    @IBAction func redButton(_ sender: Any) {
        redButton.backgroundColor = UIColor.gray
        result.append("0")
    }
    @IBAction func orangeButton(_ sender: Any) {
        orangeButton.backgroundColor = UIColor.gray
        result.append("1")
    }
    @IBAction func yellowButton(_ sender: Any) {
        yellowButton.backgroundColor = UIColor.gray
        result.append("1")
    }
    @IBAction func greenButton(_ sender: Any) {
        greenButton.backgroundColor = UIColor.gray
        result.append("2")
    }
    @IBAction func blueButton(_ sender: Any) {
    blueButton.backgroundColor = UIColor.gray
        result.append("2")
    }
    @IBAction func purpleButton(_ sender: Any) {
        purpleButton.backgroundColor = UIColor.gray
        result.append("0")
    }
    @IBAction func pinkButton(_ sender: Any) {
        pinkButton.backgroundColor = UIColor.gray
        result.append("0")
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.destination is MiniQ3ViewController {
            
            let vc = segue.destination as? MiniQ3ViewController
            vc?.final = (result)
            vc?.names = (nm)
        
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
