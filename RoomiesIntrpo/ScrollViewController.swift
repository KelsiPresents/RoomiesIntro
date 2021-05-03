//
//  ScrollViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 3/25/21.
//
import iCarousel
import UIKit
import FirebaseCore
import FirebaseFirestore


class ScrollViewController: UIViewController, iCarouselDataSource {
    
    
    var guess: String = ""
    var guess2: String = ""
    var name:Array = [""]
    var age:Array = [""]
    var grade:Array = [""]
    var major:Array = [""]
    var bio:Array = [""]
    var image:Array = [""]
    
    
    
    
    
    
    
    
    var db: Firestore?
    
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return matches.count
        
    }
    var matches = [Match]()
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width/1.4, height: 300))
//        view.backgroundColor = .red
        let match = matches[index]
        let imageView = UIImageView(frame: view.bounds)
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage (named: match.imageName)
        return view
        
    }
    
     
    let myCarousel: iCarousel = {
        let view = iCarousel()
        view.type = .coverFlow
        
        return view
    }()
    // Connect a UIImageView to the outlet below
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileInfo()
        
//
//////
//        var usersRef = db.collection("users")
//
//
//        // Create a query against the collection.
//        let query = usersRef.whereField("age", isEqualTo: "17")

        
        
        let match1 = Match(name: "\(name)", imageName: "\(image)", bio: "\(bio)")
        
        let match2 = Match(name: "\(name)", imageName: "\(image)", bio: "\(bio)")
        let match3 = Match(name: "\(name)", imageName: "\(image)", bio: "\(bio)")
        
        matches = [match1, match2, match3]
        view.addSubview(myCarousel)
        myCarousel.dataSource = self
        myCarousel.frame = CGRect(x: 0, y: 200, width: view.frame.size.width, height: 400)
//        test.text = "\(guess)"
//        test2.text = "\(guess2)"
        let settings = FirestoreSettings()

                Firestore.firestore().settings = settings
                // [END setup]
        db = Firestore.firestore()
        
        profileInfo()
        // Do any additional setup after loading the view.
    }
    
    
    func profileInfo() {
//        ref = db?.collection("users").get]Document()
        
        db?.collection("users").getDocuments() { [self] (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {

                for document in querySnapshot!.documents {
//                    document.data()["Name"]
                    print("----------------------------------")
                    name.append("\(document.data()["Name"])")
                    age.append("\(document.data()["age"])")
                    grade.append("\(document.data()["grade"])")
                    major.append("\(document.data()["major"])")
                    bio.append("\(document.data()["bio"])")
                    image.append("\(document.data()["image"])")
                    print("----------------------------------")
                                    }
            }
        }
        
        
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
    
    
    
    @IBOutlet weak var test: UILabel!
    
    
    @IBOutlet weak var test2: UILabel!
    

    
}
