//
//  SignOutViewController.swift
//  RoomiesIntrpo
//
//  Created by admin on 5/12/21.
//

import UIKit
import Firebase

private var db: Firestore!

class SignOutViewController: UIViewController, UIApplicationDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        fetchProfile()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var collegeLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    
    @IBOutlet weak var gradeLabel: UILabel!
    
    
    @IBOutlet weak var majorLabel: UILabel!
    
    
    @IBOutlet weak var bioLabel: UILabel!
    
    
    @IBOutlet weak var instagramLabel: UIButton!
    
    
    @IBAction func onInstagramButtonPressed(_ sender: Any) {
        if let instagram = match?.instagram {
            if let url = NSURL(string: "https://www.instagram.com/" + instagram+"/"){
                UIApplication.shared.openURL(url as URL)
                
                
        }
        }
    }
    
    var match: Match?
    
    @IBAction func signOutButton(_ sender: Any) {
        let auth = Auth.auth()
        
        do{
            try auth.signOut()
        } catch let signOutError {
            let alertController = UIAlertController(title: "Error", message: signOutError.localizedDescription, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
            
        }
        performSegue(withIdentifier: "unwindSegue", sender: self)
        print("Sign Out")
    }
    func fetchProfile()  {
        let currentUserId = db.collection("users").whereField("UID", isEqualTo: Auth.auth().currentUser!.uid)
        currentUserId.getDocuments { (snapshot, error) in
            guard error == nil else {return}
            if let documentID = snapshot?.documents.first?.documentID{
                print(documentID)
                let documentReference = db.collection("users").document(documentID)
                documentReference.getDocument { document, error in
                    if let document = document, document.exists{
                        let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                        print("documentData:\(dataDescription)")
                        if let data = document.data(){
                            
                            let names = data["Name"] as? String ?? ""
                            let age = data["age"] as? String ?? ""
                            let grade = data["grade"] as? String ?? ""
                            let major = data["major"] as? String ?? ""
                            let bio = data["bio"] as? String ?? ""
                            let college = data["college"] as? String ?? ""
                            let instagram = data["instagram"] as? String ?? ""
                            if instagram == "" {
                                let match = Match(name: names, imageName: "lumi lumi logotype", bio: bio, uid: document.documentID, age: age, grade: grade, major:major, college: college)
                                self.match = match
                                self.instagramLabel.isHidden = true
                            }
                            else{
                                let match = Match(name: names, imageName: "lumi lumi logotype", bio: bio, uid: document.documentID, age: age, grade: grade, major:major, college: college, instagram: instagram)
                                self.match = match
                                self.instagramLabel.isHidden = false
                            }
                            if let match = self.match {
                                self.parent?.title = match.name
                                self.collegeLabel.text = match.college
                                self.ageLabel.text = match.age
                                self.bioLabel.text = match.bio
                                self.majorLabel.text = match.major
                                self.gradeLabel.text = match.grade
                            }
                            
                        }
                    }
                    else{
                        print("document does not exist")
                    }
                }
            }
        }
        //            let userDocRef = db.collection("users").document(documentID)
        //                userDocRef.updateData(["likedUsers" : FieldValue.arrayUnion([self.displayedUserId])])
        //            }
    
}

var handle: AuthStateDidChangeListenerHandle?
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    self.tabBarController?.navigationItem.setHidesBackButton(true, animated: false)
    handle = Auth.auth().addStateDidChangeListener { (auth, user) in
        
        print(user?.email)
        self.parent?.title = "Find Users"
        // ...
    }
}
override func viewWillDisappear(_ animated: Bool) {
    Auth.auth().removeStateDidChangeListener(handle!)
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
