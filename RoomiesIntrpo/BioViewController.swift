//
//  BioViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 3/24/21.
//

import UIKit
import FirebaseStorage
import FirebaseAuth
import FirebaseFirestore

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
    
    var db: Firestore!
 

    var fullName:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
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
    
    @IBOutlet weak var collegeTextField: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.destination is ProfileViewController {
            
            let pc = segue.destination as! ProfileViewController
            pc.fill = nameTextField.text!
            pc.fill2 = age
            pc.fill3 = grade
            pc.fill4 = majorTextField.text!
            pc.fill5 = bioTextField.text!
            pc.insta = instaTextField.text!
            pc.image = imageView.image
            pc.college = collegeTextField.text!
            
        }
        
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return}
        guard let data = image.jpegData(compressionQuality: 1.0) else {return}
        guard let currentUser = Auth.auth().currentUser else {return}
        dismiss(animated: true)
        imageView.image = image
        // Create a root reference
        let storage = Storage.storage()
        let storageRef = storage.reference()

        // Create a reference to "mountains.jpg"
        let userRef = storageRef.child("\(currentUser.uid).jpg")

        // Create a reference to 'images/mountains.jpg'
        let userImagesRef = storageRef.child("images/\(currentUser.uid).jpg")

        // While the file names are the same, the references point to different files
        //userRef.name == userImagesRef.name;            // true
        //userRef.fullPath == userImagesRef.fullPath;    // false
            
        // Upload the file to the path "images/rivers.jpg"
        let uploadTask = userRef.putData(data, metadata: nil) { (metadata, error) in
          guard let metadata = metadata else {
            // Uh-oh, an error occurred!
            return
          }
          // Metadata contains file metadata such as size, content-type.
          let size = metadata.size
          // You can also access to download URL after upload.
          userRef.downloadURL { (url, error) in
            guard let downloadURL = url else {
              // Uh-oh, an error occurred!
              return
            }
            print(downloadURL)
          }
        }
        uploadTask.resume()
        
        
        
        
    }
    
    @IBAction func onProfileImageTapped(_ sender: UITapGestureRecognizer) {
        print("I was tapped")

    }
    
    @IBOutlet weak var agePickerView: UIPickerView!
    
    
    @IBOutlet weak var gradePickerView: UIPickerView!
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // dismiss keyboard
        return true
    }
}
