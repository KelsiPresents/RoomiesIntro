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
        matchView.bioTextView.text = "Age: " + match.age + "\n" + match.bio + "\n" + match.college + "\n" + match.major
        
        
        
        
        
        return view
    }
    func fetchData() {
        spinner.isHidden = false
        spinner.startAnimating()
        let matchesRef = db.collection("users")
        matchesRef.getDocuments() { [self] (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                self.matches.removeAll()
                for document in querySnapshot!.documents {
                    if self.matches.count == 0 {
                        self.displayedUserId = document.documentID
                    }
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
                        let match = Match(name: names, imageName: "lumi lumi logotype", bio: bio, uid: document.documentID, age: age, grade: grade, major:major, college: college)
                        if blocked == false{
                            self.matches.append(match)
                        }
                        
                        
                        
                    }
                    else{
                        let match = Match(name: names, imageName: "lumi lumi logotype", bio: bio, uid: document.documentID, age: age, grade: grade, major:major, college: college, instagram: instagram)
                        if blocked == false{
                            self.matches.append(match)
                        }
                        
                    }
                    
                }
                self.myCarousel.isHidden = false
                self.spinner.stopAnimating()
                self.spinner.isHidden = true
                self.myCarousel.reloadData()
                self.likeButton.isHidden = false
                self.dislikeButton.isHidden = false
                if testing == "true"{
                    likeButton.isHidden = true
                    dislikeButton.isHidden = true
                }
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
        let index = carousel.currentItemIndex
        let match = matches[index]
        displayedUserId = match.uid
        dislikeButton.setImage(UIImage(named: "dislike"), for: .normal)
        likeButton.setImage(UIImage(named: "like"), for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        fetchData()
        var result:String = ""
        var timer : Timer?
        
        timer = Timer.scheduledTimer(timeInterval:20, target:self, selector:#selector(timing), userInfo: nil, repeats: true)
       
        print(testing)
        
        let match1 = Match(name: "Kelsi", imageName: "finishedProfile1", bio: "Hello", uid: "0", age: "17", grade: "freshman", major: "computer science", college: "University Of Michigan")
        
        let match2 = Match(name: "Kelsi", imageName: "finishedProfile1", bio: "Hello", uid: "0", age: "17", grade: "freshman", major: "computer science", college: "University Of Michigan")
        
        let match3 = Match(name: "Kelsi", imageName: "finishedProfile1", bio: "Hello", uid: "0", age: "17", grade: "freshman", major: "computer science", college: "University Of Michigan")
        
        
        matches = [match1, match2, match3]
        view.addSubview(myCarousel)
        myCarousel.dataSource = self
        myCarousel.frame = CGRect(x: 0, y: view.frame.size.height/10, width: view.frame.size.width, height: view.frame.size.height/2)
        myCarousel.isHidden = true
        spinner.startAnimating()
        likeButton.isHidden = true
        dislikeButton.isHidden = true
        myCarousel.delegate = self
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.email)
            // User is signed in.
            
            // ...
        } else {
            print("no user signed in")
            // No user is signed in.
            // ...
        }
        // Do any additional setup after loading the view.
        
        
    }
    
    var testing:String = ""
   
    
    @IBOutlet weak var likeButton: UIButton!
    
    var displayedUserId = ""
   
    
    @IBAction func onFlagButtonPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Block User", message: "Are you sure you want to block this user and flag this content as objectionable?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { action in
            print("Block User")
            let likedUserDocRef = db.collection("users").document(self.displayedUserId)
            //                        let newLikedUserDocRef = documentReference.setData([FieldValue: likedUserDocRef], merge: true)
//            likedUserDocRef.getDocument { document, error in
//                if let document = document, document.exists{
//                    let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//                    print("documentData:\(dataDescription)")
//                    document.set
//
//                }
//            }
            
            likedUserDocRef.setData(["blocked" : true], merge: true) { error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    self.fetchData()
                }
            }
            
        }
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        present(alertController, animated: true, completion: nil)
        
        
    }
    
//    func displayAlert()     {         let alert = UIAlertController(title: "My Title", message: "This is my message.", preferredStyle: UIAlertController.Style.alert)                   alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))??????        ???        self.present(alert, animated: true, completion: nil)???        self.timer = Timer.scheduledTimerWithTimeInterval(50.0, target: self, selector: <#Selector#>, userInfo: nil, repeats: false)??????        timer.invalidate()???}
    
    @IBOutlet weak var dislikeButton: UIButton!
    @IBAction func likeButtonPressed(_ sender: UIButton) {
        //        self.matches.removeFirst()
        sender.setImage(UIImage(named: "blue like"), for: .normal)
        dislikeButton.setImage(UIImage(named: "dislike"), for: .normal)
        //        myCarousel.reloadData()
        // Create an initial document to update.
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
                        let likedUserDocRef = db.collection("users").document(self.displayedUserId)
                        //                        let newLikedUserDocRef = documentReference.setData([FieldValue: likedUserDocRef], merge: true)
                        likedUserDocRef.getDocument { document, error in
                            if let document = document, document.exists{
                                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                                print("documentData:\(dataDescription)")
                                let likedUsersCollectionReference = documentReference.collection("likedUsers")
                                likedUsersCollectionReference.addDocument(data: document.data()!) { error in
                                    if let error = error{
                                        print(error.localizedDescription)
                                    }
                                }
                                
                            }
                        }
                        //                        let likedUsers = document.get("likedUsers") as! [DocumentReference]
                        
                        //                        print(likedUsers.first?.documentID)
                    }
                    else{
                        print("document does not exist")
                    }
                }
            }
            
            //            let userDocRef = db.collection("users").document(documentID)
            //                userDocRef.updateData(["likedUsers" : FieldValue.arrayUnion([self.displayedUserId])])
            //            }
        }
        
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
        self.parent?.title = "Find Users"
        self.tabBarController?.navigationItem.setHidesBackButton(true, animated: false)
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            
            print(user?.email)
            
            // ...
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
   
    
    
    
    @objc func timing(){
        if testing == "true"{
            
            let alertController = UIAlertController(title: "Do You Want To Continue?", message: "Please sign up to continue using the app", preferredStyle: .alert)
//            let cancelAction = UIAlertAction(title: "Sign Up", style: .cancel, handler: nil)
//            self.timer = Timer.scheduledTimerWithTimeInterval(50.0, target: self, selector: <#Selector#>, userInfo: nil, repeats: false)
            let signUpButton = UIAlertAction(title: "Sign Up", style: .cancel, handler: { action in self.performSegue(withIdentifier: "signUpButtonPressed", sender: self)})
            alertController.addAction(signUpButton)
//            Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(timing), userInfo: nil, repeats: true)
//            self.perform(selector(UIAlertController()), with: nil, afterDelay: 300)
            present(alertController, animated: true, completion: nil)
//            if buttonTitle == "Sign Up" {???            self.performSegue(withIdentifier: ":)", sender: self)
        
    }
    
}
}

