//
//  SecondQuestionaireViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 4/6/21.
//

import UIKit

class SecondQuestionaireViewController: UIViewController {
    
    var filling:String = ""
    var filling2:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collegeTextField.delegate = self
    }

    @IBOutlet weak var collegeTextField: UITextField!
    
       
        
//        self.collegePickerView.delegate = self
//        self.collegePickerView.dataSource = self
        
//        testLabel.text = filling
//        testLabel2.text = filling2
        
//         secondPickerData = ["Bradley University", "Iliinois Institute of Technology",
//    "Northeastern University", "University of Michigan"]
//        // Do any additional setup after loading the view.
//    }
//
    
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return secondPickerData.count
//    }
//
    
    
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return secondPickerData.count
//    }
//
//    internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int ) -> String?{
//
//            return secondPickerData[row]
//        }
////
//    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {}
    
    
    
//    @IBOutlet weak var testLabel2: UILabel!
//    @IBOutlet weak var testLabel: UILabel!
//
//    @IBOutlet weak var collegePickerView: UIPickerView!
//
//
//
//    var secondPickerData:[String] = [String]()
//
     
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    }
    extension SecondQuestionaireViewController: UITextFieldDelegate {
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder() // dismiss keyboard
            return true
        }
    }
