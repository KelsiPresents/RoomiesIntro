//
//  WelcomingViewController.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 4/8/21.
//
import iCarousel
import UIKit

class WelcomingViewController: UIViewController , iCarouselDataSource {
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 3
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width/1.4, height: 300))
//        view.backgroundColor = .red
        
        let imageView = UIImageView(frame: view.bounds)
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage (named: "intro\(index + 1)")
        return view
    }
    
     
    let myCarousel: iCarousel = {
        let view = iCarousel()
        view.type = .rotary
        
        return view
    }()
    // Connect a UIImageView to the outlet below
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myCarousel)
        myCarousel.dataSource = self
        myCarousel.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 400)
        myCarousel.autoscroll = -0.2
       
        // Do any additional setup after loading the view.
    }
    
  
}

