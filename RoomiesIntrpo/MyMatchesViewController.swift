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
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.textLabel?.text = "\(matches[indexPath.row].name)"
        //        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "matchDetailSegue", sender: self)
    }
    var handle: AuthStateDidChangeListenerHandle?
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.parent?.title = "Liked Users"
        self.tabBarController?.navigationItem.setHidesBackButton(true, animated: false)
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
        
            
            print(user?.email)
            
            // ...
        }
        fetchMatches()
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
    
    
    func fetchMatches() {
        let currentUserId = db.collection("users").whereField("UID", isEqualTo: Auth.auth().currentUser!.uid)
        currentUserId.getDocuments { [self] (snapshot, error) in
            guard error == nil else {return}
            if let documentID = snapshot?.documents.first?.documentID{
                print(documentID)
                let documentReference = db.collection("users").document(documentID).collection("likedUsers")
                
                documentReference.getDocuments { querySnapshot, error in
                    if let error = error{
                        print("Error getting documents: \(error)")
                    } else{
                        print(querySnapshot?.documents.count)
                        self.matches.removeAll()
                        for document in querySnapshot!.documents {
                            print("\(document.documentID) => \(document.data())")
                            let data = document.data()
                            let blocked = data["blocked"] as? Bool ?? false
                            
                            let names = data["Name"] as? String ?? ""
                            let age = data["age"] as? String ?? ""
                            let grade = data["grade"] as? String ?? ""
                            let major = data["major"] as? String ?? ""
                            let bio = data["bio"] as? String ?? ""
                            let college = data["college"] as? String ?? ""
                            let instagram = data["instagram"] as? String ?? ""
                            if instagram == "" {
                                let match = Match(name: names, imageName: "", bio: bio, uid: document.documentID, age: age, grade: grade, major: major, college: college)
                                if blocked == false {
                                    matches.append(match)
                                }
                                
                                
                            }
                            else{
                                let match = Match(name: names, imageName: "", bio: bio, uid: document.documentID, age: age, grade: grade, major: major, college: college, instagram: instagram)
                                if blocked == false {
                                    matches.append(match)
                                }
                            }
                            matchesTableView.reloadData()
                        }
                        
                        
                        showOrHideTableView()
                    }
                }
                
            }
            else{
                print("document does not exist")
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! MatchDetailViewController
        if let indexPath = matchesTableView.indexPathForSelectedRow{
            let match = matches[indexPath.row]
            dvc.match = match
        }
        
    }
    
    
    @IBOutlet weak var matchesTableView: UITableView!
    
    
    
    
}
