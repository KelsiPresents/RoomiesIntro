//
//  MyMatchesViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 5/5/21.
//

import UIKit
import FirebaseFirestore



class MyMatchesViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return value.count
    }
    
    private var db: Firestore!
    var matches = [Match]()
    var value = ["Waiting For A Response..."]
//    let matched = matches[index]
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.textLabel?.text = "\(value[indexPath.row])"
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
   
    var colors = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.blue, UIColor.purple]

    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        fetchData()
        matchesTableView.reloadData()
        
        // Do any additional setup after loading the view.
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
                    
                    value.append(names)
                    matchesTableView.reloadData()
                }
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
