//
//  BioViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 3/24/21.
//

import UIKit

class BioViewController: UIViewController, UIImagePickerControllerDelegate, UICollectionViewDelegate, UINavigationControllerDelegate {

    var fullName:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
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
            pc?.fill2 = (ageTextField.text!)
            pc?.fill3 = (gradeTextField.text!)
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
    
    
    

}
