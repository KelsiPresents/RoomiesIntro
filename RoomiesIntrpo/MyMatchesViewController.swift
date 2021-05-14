//
//  MyMatchesViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 5/5/21.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth


class MyMatchesViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    
    private var db: Firestore!
    var matches = [Match]()
    var value = [""]
    //    let matched = matches[index]
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.textLabel?.text = "\(matches[indexPath.row].name)"
        //        cell.backgroundColor = colors[indexPath.row]
        return cell
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
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        showOrHideTableView()
        //        fetchData()
        fetchMatches()
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var noMatchesLabel: UILabel!
    
    func showOrHideTableView() {
        if matches.count == 0{
            matchesTableView.isHidden = true
            noMatchesLabel.isHidden = false
        }
        else{
            matchesTableView.isHidden = false
            noMatchesLabel.isHidden = true
        }
    }
    func fetchData() {
        let matchesRef = db.collection("users")
        matchesRef.getDocuments() { [self] (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                self.matches.removeAll()
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    let data = document.data()
                    let names = data["Name"] as? String ?? "Something is not right"
                    let age = data["age"] as? String ?? "Something is not right"
                    let grade = data["grade"] as? String ?? "Something is not right"
                    let major = data["major"] as? String ?? "Something is not right"
                    let bio = data["bio"] as? String ?? "Something is not right"
                    let match = Match(name: names, imageName: "", bio: bio, uid: document.documentID)
                    matches.append(match)
                    matchesTableView.reloadData()
                }
            }
            showOrHideTableView()
            
        }
    }
    
    func fetchMatches() {
        let currentUserId = db.collection("users").whereField("UID", isEqualTo: Auth.auth().currentUser!.uid)
        currentUserId.getDocuments { [self] (snapshot, error) in
            guard error == nil else {return}
            if let documentID = snapshot?.documents.first?.documentID{
                print(documentID)
                let documentReference = db.collection("likedusers").document(documentID).collection("likedUsers")
//                documentReference.getDocuments() { [self] (querySnapshot, err) in
//                    if let err = err {
//                        print("Error getting documents: \(err)")
//                    } else {
//                        self.matches.removeAll()
//                        for document in querySnapshot!.documents {
//                            print("\(document.documentID) => \(document.data())")
//                            let data = document.data()
//                            let names = data["Name"] as? String ?? "Something is not right"
//                            let age = data["age"] as? String ?? "Something is not right"
//                            let grade = data["grade"] as? String ?? "Something is not right"
//                            let major = data["major"] as? String ?? "Something is not right"
//                            let bio = data["bio"] as? String ?? "Something is not right"
//                            let match = Match(name: names, imageName: "", bio: bio, uid: document.documentID)
//                            matches.append(match)
//                            matchesTableView.reloadData()
//                        }
//
//                    }
//                    showOrHideTableView()
//
//                }
                documentReference.getDocuments { querySnapshot, error in
                    if let error = error{
                        print("Error getting documents: \(error)")
                    } else{
                        print(querySnapshot?.documents.count)
                    }
                }
                
            }
            else{
                print("document does not exist")
            }
        }
        
    }
    



@IBOutlet weak var matchesTableView: UITableView!


//    @IBAction func onAddColorButtonPressed(_ sender: UIBarButtonItem) {
//        let red = CGFloat.random(in: 0...1)
//        let green = CGFloat.random(in: 0...1)
//        let blue = CGFloat.random(in: 0...1)
//        let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
//        colors.append(color)
//        rainbowTableView.reloadData()
//}


}
