//
//  TinderSwipeViewController.swift
//  RoomiesIntrpo
//
//  Created by admin on 4/19/21.
//

import UIKit
import Shuffle_iOS

class SwipeCard: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func card(fromImage image: UIImage) -> SwipeCard {
      let card = SwipeCard()
//      card.swipeDirections = [.left, .right]
//      card.content = UIImageView(image: image)
//
//      let leftOverlay = UIView()
//      leftoverlay.backgroundColor = .green
//
//      let rightOverlay = UIView()
//      rightOverlay.backgroundColor = .red
//
//      card.setOverlays([.left: leftOverlay, .right: rightOverlay])
      
      return card
    }
    
   
    class ViewController: UIViewController {
      let cardStack = SwipeCardStack()
      
      let cardImages = [
          UIImage(named: "cardImage1"),
          UIImage(named: "cardImage2"),
          UIImage(named: "cardImage3")
      ]
      
      override func viewDidLoad() {
        super.viewDidLoad()
//        view.addSubview(cardStack)
//        cardStack.frame = view.safeAreaLayoutGuide.layoutFrame
      }
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
