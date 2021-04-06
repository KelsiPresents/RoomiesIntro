//
//  SecondQuestionaireViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 4/6/21.
//

import UIKit

class SecondQuestionaireViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.collegePickerView.delegate = self
        self.collegePickerView.dataSource = self
        
        
        
         secondPickerData = ["Bradley University", "Iliinois Institute of Technology",
    "Northeastern University", "University of Michigan"]
        // Do any additional setup after loading the view.
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return secondPickerData.count
    }
    
    
    
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return secondPickerData.count
//    }
//
    internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int ) -> String?{

            return secondPickerData[row]
        }
//
//    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {}
    
    
    
    
    @IBOutlet weak var collegePickerView: UIPickerView!
    
    
    
    var secondPickerData:[String] = [String]()
    
     
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
