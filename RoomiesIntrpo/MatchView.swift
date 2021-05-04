//
//  MatchView.swift
//  RoomiesIntrpo
//
//  Created by admin on 5/3/21.
//

import UIKit

class MatchView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageProfile: UIImageView!
  
    @IBOutlet weak var labelProfile: UILabel!
    
    @IBOutlet weak var bioTextView: UITextView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    private func commonInit(){
        Bundle.main.loadNibNamed("MatchView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
