//
//  LoginViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 3/16/21.
//
import iCarousel
import UIKit

class LoginViewController: UIViewController,  iCarouselDataSource {

    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 3
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width/1.4, height: 300))
//        view.backgroundColor = .red
        
        let imageView = UIImageView(frame: view.bounds)
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage (named: "profile\(index + 1)")
        return view
    }
    
    let myCarousel: iCarousel = {
        let view = iCarousel()
        view.type = .coverFlow
        
        return view
    }()
    
    
    var personality:String = ""
    var name: String = ""
    
    
    
    @IBOutlet weak var profileBrowseView: UIImageView!
    
var imageNames = ["profile", "secondprofile", "3rdprofile"]
    
    
    
    @IBOutlet weak var headerLabel: UILabel!
    
   
    @IBOutlet weak var schoolLabel: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        schoolLabel?.text = (name + ", you are a " + personality.lowercased() + " person and below are some more " + personality.lowercased() + " people,  looking  for roomates too!")
        schoolLabel.font = UIFont.systemFont(ofSize: 30.0)
        
        headerLabel?.text = ("You are ... " + personality)
        
        view.addSubview(myCarousel)
        myCarousel.dataSource = self
        myCarousel.frame = CGRect(x: 0, y: 200, width: view.frame.size.width, height: 400)
       
        // Do any additional setup after loading the view.
    }
        // Do any additional setup after loading the view.
    }

   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


