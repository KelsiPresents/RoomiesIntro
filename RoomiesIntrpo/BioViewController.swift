//
//  BioViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 3/24/21.
//

import UIKit

class BioViewController: UIViewController, UIImagePickerControllerDelegate, UICollectionViewDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
                return agePickerData.count
            } else {
                return gradePickerData.count
            }
        
    }
    
    var age:String = ""
    var grade:String = ""
    

    var fullName:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.agePickerView.delegate = self
        self.agePickerView.dataSource = self
        self.gradePickerView.delegate = self
        self.gradePickerView.dataSource = self
        majorTextField.delegate = self
        bioTextField.delegate = self
        instaTextField.delegate = self
        nameTextField.delegate = self
        
        agePickerData = ["",
   "17", "18", "19", "20", "21"]
        
        gradePickerData = ["", "Freshman",
   "Sophomore", "Junior", "Senior"]
        
        // Do any additional setup after loading the view.
    }
    
    
    internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int ) -> String?{
        if pickerView.tag == 1 {
            
                return agePickerData[row]
            } else {
                return gradePickerData[row]
            }
        }
    
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        age = "\(agePickerData[row])"
        grade = "\(gradePickerData[row])"
        
    }
   
    
    
    var agePickerData:[String] = [String]()
    
    var gradePickerData:[String] = [String]()
    
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var gradeTextField: UITextField!
    
    @IBOutlet weak var majorTextField: UITextField!
    
    @IBOutlet weak var bioTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var instaTextField: UITextField!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.destination is ProfileViewController {
            
            let pc = segue.destination as? ProfileViewController
            pc?.fill = (nameTextField.text!)
            pc?.fill2 = (age)
            pc?.fill3 = (grade)
            pc?.fill4 = (majorTextField.text!)
            pc?.fill5 = (bioTextField.text!)
            pc?.insta = (instaTextField.text!)
            pc?.image = imageView.image
            
            
        }
        
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return}
        imageView.image = image
        dismiss(animated: true)
    }
    
    @IBAction func onProfileImageTapped(_ sender: UITapGestureRecognizer) {
        print("I was tapped")
        let picker = UIImagePickerController()
            picker.allowsEditing = true
            picker.delegate = self
            present(picker, animated: true)
    }
    
    @IBOutlet weak var agePickerView: UIPickerView!
    
    
    @IBOutlet weak var gradePickerView: UIPickerView!
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // dismiss keyboard
        return true
    }
}
