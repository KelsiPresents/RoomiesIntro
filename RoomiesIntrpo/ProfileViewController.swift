//
//  ProfileViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 3/24/21.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class ProfileViewController: UIViewController {
    var fill:String = ""
    var fill2:String = ""
    var fill3:String = ""
    var fill4:String = ""
    var fill5:String = ""
    var insta:String = ""
    var first = [""]
    var second = [""]
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
    
    
    // Create a reference to the cities collection
   

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
            "Name": "\(nameLabel.text!)",
            "age": "\(ageLabel.text!)",
            "grade": "\(gradeLabel.text!)",
            "major": "\(majorLabel.text!)",
            "bio": "\(bioLabel.text!)",
            "image": "\(image!)",
            "instagram": insta,
            "UID": Auth.auth().currentUser!.uid
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
        
        let usersRef = db.collection("users")
        
        
        // Create a query against the collection.
       // let query = usersRef.whereField("age", isEqualTo: "17")
        
//        db.collection("users").getDocuments() { [self] (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//
//                for document in querySnapshot!.documents {
////                    document.data()["Name"]
//                    first.append("\(document.data()["Name"])")
//                    second.append("\(document.data()["age"])")
//                    print("\(document.data()["grade"])")
//                    print("\(document.data()["major"])")
//                    print("\(document.data()["bio"])")
//                    print("\(document.data()["image"])")
//
//
//
//
//                }
//            }
//        }
    
//        print("------------------------------")
//        print(first)
//        print(second)
//        print("------------------------------")
//
//
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let dataDescription = document.data().??; "nil"
//                print("Document data: \(dataDescription)")
//            } else {
//                print("Document does not exist")
//            }
//        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.destination is SecondQuestionaireViewController {
            
            let vc = segue.destination as? SecondQuestionaireViewController
            vc?.filling = "\(first)"
            vc?.filling2 = "\(second)"
            print(first)
        }
        
        
    }
    var handle: AuthStateDidChangeListenerHandle?
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            
            print(user?.email)
            
          // ...
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
   
    // MARK: - Navigation

//    In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         Get the new view controller using segue.destination.
//         Pass the selected object to the new view controller.
//    }
    

}
