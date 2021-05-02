//
//  ProfileViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 3/24/21.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

class ProfileViewController: UIViewController {
    var fill:String = ""
    var fill2:String = ""
    var fill3:String = ""
    var fill4:String = ""
    var fill5:String = ""
    var insta:String = ""
    var image:UIImage?
    
    var db: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "\(fill)"
        ageLabel.text = "\(fill2)"
        gradeLabel.text = "\(fill3)"
        majorLabel.text = "\(fill4)"
        bioLabel.text = "\(fill5)"
        if let image = image {
            imageView.image = image
        }
        
        let settings = FirestoreSettings()

                Firestore.firestore().settings = settings
                // [END setup]
                db = Firestore.firestore()
       
        
        // Do any additional setup after loading the view.
    }
    
    
   
   
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var gradeLabel: UILabel!
    
    @IBOutlet weak var majorLabel: UILabel!
    
    
    @IBOutlet weak var bioLabel: UILabel!
    
    
    @IBAction func instagramPressed(_ sender: Any) {
        
        if let url = NSURL(string: "https://www.instagram.com/" + insta+"/"){
            UIApplication.shared.openURL(url as URL)
            
            
    }
    }
    
    
    @IBAction func doneWithProfileClicked(_ sender: Any) {
        var ref: DocumentReference? = nil
        ref = db.collection("users").addDocument(data: [
            "Name": "\(String(describing: nameLabel.text))",
            "age": "\(String(describing: ageLabel.text))",
            "grade": "\(String(describing: gradeLabel.text))",
            "major": "\(String(describing: majorLabel.text))",
            "bio": "\(String(describing: bioLabel.text))"
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
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
