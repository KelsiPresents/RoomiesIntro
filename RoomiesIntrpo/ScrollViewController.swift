//
//  ScrollViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 3/25/21.
//
import iCarousel
import UIKit
import Firebase

private var db: Firestore!



class ScrollViewController: UIViewController, iCarouselDataSource, iCarouselDelegate {
    func numberOfItems(in carousel: iCarousel) -> Int {
        return matches.count
    }
    var matches = [Match]()
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width/1.4, height: 300))
//        view.backgroundColor = .red
        let match = matches[index]
        let matchView = MatchView(frame:view.bounds)
        view.addSubview(matchView)
        matchView.labelProfile.text = match.name
//        let imageView = UIImageView(frame: view.bounds)
//        view.addSubview(imageView)
        matchView.imageProfile.contentMode = .scaleAspectFit
        matchView.imageProfile.image = UIImage (named: match.imageName)
        matchView.bioTextView.text = match.bio
        return view
    }
    func fetchData() {
        let matchesRef = db.collection("users")
        matchesRef.getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                self.matches.removeAll()
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    let data = document.data()
                    let name = data["Name"] as? String ?? "Something is not right"
                    let age = data["age"] as? String ?? "Something is not right"
                    let grade = data["grade"] as? String ?? "Something is not right"
                    let major = data["major"] as? String ?? "Something is not right"
                    let bio = data["bio"] as? String ?? "Something is not right"
                    var match = Match(name: name, imageName: "lumi lumi logotype", bio: "Age: \(age) \nGrade: \(grade)\nMajor: \(major)\nBio: \(bio)")
                    
                    self.matches.append(match)
                }
                self.myCarousel.isHidden = false
                self.spinner.stopAnimating()
                self.spinner.removeFromSuperview()
                self.myCarousel.reloadData()
                self.likeButton.isHidden = false
                self.dislikeButton.isHidden = false
            }
        }
    }
     
    let myCarousel: iCarousel = {
        let view = iCarousel()
        view.type = .coverFlow
        
        return view
    }()
    // Connect a UIImageView to the outlet below
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    func carouselCurrentItemIndexDidChange(_ carousel: iCarousel) {
        
        dislikeButton.setImage(UIImage(named: "dislike"), for: .normal)
        likeButton.setImage(UIImage(named: "like"), for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        fetchData()
        let match1 = Match(name: "Kelsi", imageName: "finishedProfile1", bio: "Hello")
        
        let match2 = Match(name: "Kelsi", imageName: "finishedProfile2", bio: "Hello")
        let match3 = Match(name: "Kelsi", imageName: "finishedProfile3", bio: "Hello")
        matches = [match1, match2, match3]
        view.addSubview(myCarousel)
        myCarousel.dataSource = self
        myCarousel.frame = CGRect(x: 0, y: 200, width: view.frame.size.width, height: 400)
        myCarousel.isHidden = true
        spinner.startAnimating()
        likeButton.isHidden = true
        dislikeButton.isHidden = true
        myCarousel.delegate = self
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.displayName)
          // User is signed in.
            
          // ...
        } else {
            print("no user signed in")
          // No user is signed in.
          // ...
        }
        // Do any additional setup after loading the view.
    }
   
    @IBOutlet weak var likeButton: UIButton!
    

    
    
    @IBOutlet weak var dislikeButton: UIButton!
    @IBAction func likeButtonPressed(_ sender: UIButton) {
//        self.matches.removeFirst()
        sender.setImage(UIImage(named: "blue like"), for: .normal)
        dislikeButton.setImage(UIImage(named: "dislike"), for: .normal)
//        myCarousel.reloadData()
    }
    
    @IBAction func dislikeButtonPressed(_ sender: UIButton) {
        self.matches.removeFirst()
        sender.setImage(UIImage(named: "final"), for: .normal)
        likeButton.setImage(UIImage(named: "like"), for: .normal)
        myCarousel.reloadData()
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
    
}
