//
//  MiniQ3ViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 4/3/21.
//

import UIKit

class MiniQ3ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var final:String = ""
    var finalResults:String = ""
    var names:String = ""
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int ) -> String?{
        
            return pickerData[row]
        }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        final.append("\(pickerData[row])")
        
        if final == "10Spongebob" {
        finalResults = "Optimistic"
        
        }
        else if final == "10Patrick" {
            finalResults = "Optimistic"
            
        }
        if final == "11Spongebob" {
        finalResults = "Optimistic"
        
        }
        else if final == "11Patrick" {
            finalResults = "Optomistic"
            
        }
        if final == "12Spongebob" {
        finalResults = "Optimistic"
        
        }
        else if final == "12Patrick" {
            finalResults = "Optimistic"
            
        }
        else if final == "00Squidward"{
            finalResults = "Realistic"
        }
        else if final == "00Plankton" {
            finalResults = "Realistic"
            
        }
        else if final == "00Patrick" {
            finalResults = "Energetic"
            
        }
        else if final == "00Spongebob" {
            finalResults = "Energetic"
            
        }
        else if final == "00Pearl" {
            finalResults = "Energetic"
        
        }
        else if final == "01Squidward" {
            finalResults = "Realistic"
        }
        else if final == "01Plankton" {
            finalResults = "Realistic"
            
        }
        else if final == "01Patrick" {
            finalResults = "Energetic"
            
        }
        else if final == "01Spongebob" {
            finalResults = "Energetic"
            
        }
        else if final == "01Pearl" {
            finalResults = "Energetic"
            
        }
            
    
        else if final == "02Squidward"{
            finalResults = "Realistic"
        }
        else if final == "02Plankton" {
            finalResults = "Realistic"
            
        }
        else if final == "02Patrick" {
            finalResults = "Energetic"
            
        }
        else if final == "02Spongebob" {
            finalResults = "Energetic"
            
        }
        else if final == "02Pearl" {
            finalResults = "Energetic"
            
        }


        else if final == "00Sandy" {
            finalResults = "Hard Working"
            
        }
        else if final == "00Mr.Krabs" {
            finalResults = "HardWorking"
            
        }
        else if final == "00Gary" {
            finalResults = "Laid Back"
            
        }
        else if final == "00Karen" {
            finalResults = "Laid Back"
            
        }
        
        else if final == "01Sandy" {
            finalResults = "Hard Working"
            
        }
        else if final == "01Mr.Krabs" {
            finalResults = "HardWorking"
            
        }
        else if final == "01Gary" {
            finalResults = "Laid Back"
            
        }
        else if final == "01Karen" {
            finalResults = "Laid Back"
            
        }
        
        else if final == "02Sandy" {
            finalResults = "Hard Working"
            
        }
        else if final == "02Mr.Krabs" {
            finalResults = "HardWorking"
            
        }
        else if final == "02Gary" {
            finalResults = "Laid Back"
            
        }
        else if final == "02Karen" {
            finalResults = "Laid Back"
            
        }
        else if final == "10Gary" {
            finalResults = "Laid Back"
            
        }
        else if final == "10Karen" {
            finalResults = "Laid Back"
            
        }
        else if final == "10Squidward"{
            finalResults = "Realistic"
        }
        else if final == "10Plankton" {
            finalResults = "Realistic"
            
        }
       
        else if final == "10Pearl" {
            finalResults = "Energetic"
            
        }
        else if final == "10Sandy" {
            finalResults = "Hard Working"
            
        }
        else if final == "10Mr.Krabs" {
            finalResults = "HardWorking"
            
        }
        else if final == "11Gary" {
            finalResults = "Laid Back"
            
        }
        else if final == "11Karen" {
            finalResults = "Laid Back"
            
        }
        else if final == "11Squidward"{
            finalResults = "Realistic"
        }
        else if final == "11Plankton" {
            finalResults = "Realistic"
            
        }
       
        else if final == "11Pearl" {
            finalResults = "Energetic"
            
        }
        else if final == "11Sandy" {
            finalResults = "Hard Working"
            
        }
        else if final == "11Mr.Krabs" {
            finalResults = "Hard Working"
            
        }
        else if final == "12Gary" {
            finalResults = "Laid Back"
            
        }
        else if final == "12Karen" {
            finalResults = "Laid Back"
            
        }
        else if final == "12Squidward"{
            finalResults = "Realistic"
        }
        else if final == "12Plankton" {
            finalResults = "Realistic"
            
        }
       
        else if final == "12Pearl" {
            finalResults = "Energetic"
            
        }
        else if final == "12Sandy" {
            finalResults = "Hard Working"
            
        }
        else if final == "12Mr.Krabs" {
            finalResults = "HardWorking"
            
        }
        else if final == "00Other" {
            finalResults = "Goal-Oriented"
            
        }
        else if final == "01Other" {
            finalResults = "Goal-Oriented"
            
        }
        else if final == "02Other" {
            finalResults = "Goal-Oriented"
            
        }
        else if final == "10Other" {
            finalResults = "Creative"
            
        }
        else if final == "11Other" {
            finalResults = "Creative"
            
        }
        else if final == "12Other" {
            finalResults = "Creative"
            
        }
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
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.destination is LoginViewController {
            
            let vc = segue.destination as? LoginViewController
            vc?.personality = (finalResults)
            vc?.name = (names)
            print(final)
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
