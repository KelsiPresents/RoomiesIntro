//
//  QuestionaireViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 3/25/21.
//

import UIKit

class QuestionaireViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var cleanYes: UIButton!
    @IBAction func cleanYes(_ sender: Any) {
        cleanYes.backgroundColor = UIColor.gray
    }
    
    
    @IBOutlet weak var cleanNo: UIButton!
    @IBAction func cleanNo(_ sender: Any) {
        cleanNo.backgroundColor = UIColor.gray
        
        
        
    }
    
    
    @IBOutlet weak var majorYes: UIButton!
    @IBAction func majorYes(_ sender: Any) {
        majorYes.backgroundColor = UIColor.gray
    }
    
    
    @IBOutlet weak var majorNo: UIButton!
    @IBAction func majorNo(_ sender: Any) {
        majorNo.backgroundColor = UIColor.gray
    }

    @IBOutlet weak var majorDM: UIButton!
    @IBAction func majorDM(_ sender: Any) {
        majorDM.backgroundColor = UIColor.gray
    }
    
    @IBOutlet weak var morningYes: UIButton!
    @IBAction func morningYes(_ sender: Any) {
        morningYes.backgroundColor = UIColor.gray
    }
    
    
    @IBOutlet weak var morningNo: UIButton!
    @IBAction func morningNo(_ sender: Any) {
        morningNo.backgroundColor = UIColor.gray
    }
    
    @IBOutlet weak var sleepEight: UIButton!
    @IBAction func sleepEight(_ sender: Any) {
        sleepEight.backgroundColor = UIColor.gray
    }
    
    @IBOutlet weak var sleepTen: UIButton!
    @IBAction func sleepTen(_ sender: Any) {
        sleepTen.backgroundColor = UIColor.gray
    }
    
    @IBOutlet weak var sleepTwelve: UIButton!
    @IBAction func sleepTwelve(_ sender: Any) {
        sleepTwelve.backgroundColor = UIColor.gray
    }
    
    @IBOutlet weak var afterMidnight: UIButton!
    @IBAction func afterMidnight(_ sender: Any) {
        afterMidnight.backgroundColor = UIColor.gray
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
