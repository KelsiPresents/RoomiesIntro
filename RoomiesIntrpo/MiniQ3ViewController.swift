//
//  MiniQ3ViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 4/3/21.
//

import UIKit

class MiniQ3ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int ) -> String?{
            return pickerData[row]
        }
    

    @IBOutlet weak var spongebobPickerView: UIPickerView!
    
    var pickerData:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.spongebobPickerView.delegate = self
        self.spongebobPickerView.dataSource = self
        
        pickerData = ["Spongebob","Patrick","Squidward","Mr.Krabs","Sandy","Plankton","Pearl","Gary","Karen","Other"]
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
