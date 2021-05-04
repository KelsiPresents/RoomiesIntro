//
//  ScrollViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 3/25/21.
//
import iCarousel
import UIKit
import Firebase

var db: Firestore!



class ScrollViewController: UIViewController, iCarouselDataSource {
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
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
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
        
        // Do any additional setup after loading the view.
    }
   
    
    @IBOutlet weak var giselleButton: UIButton!
    
    @IBAction func giselleButton(_ sender: Any) {
        giselleButton.isHidden = true
        abrielButton.isHidden = false
        dislikeClickedButton.isHidden = true
        dislikeButton.isHidden = false
    }
    
    @IBOutlet weak var abrielButton: UIButton!
    
    @IBAction func abrielButton(_ sender: Any) {
        abrielButton.isHidden = true
        amirahButton.isHidden = false
        dislikeClickedButton.isHidden = true
        dislikeButton.isHidden = false
    }
    
    @IBOutlet weak var amirahButton: UIButton!
    @IBAction func amirahButton(_ sender: Any) {
        dislikeClickedButton.isHidden = true
        dislikeButton.isHidden = false
       
    }
    
    @IBOutlet weak var dislikeButton: UIButton!
    @IBOutlet weak var dislikeClickedButton: UIButton!
    @IBAction func dislikeButton(_ sender: Any) {
        amirahButton.isHidden = true
        abrielButton.isHidden = true
        giselleButton.isHidden = false
        dislikeClickedButton.isHidden = false
        dislikeButton.isHidden = true
    }
    
    
    
    
    
}
