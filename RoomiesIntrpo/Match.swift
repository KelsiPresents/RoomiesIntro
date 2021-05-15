//
//  Match.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 5/1/21.
//

import UIKit
import SwiftUI


class Match: NSObject {

    var name: String
    var imageName: String
    var bio: String
    var uid: String
    var instagram: String?
    
    init(name: String, imageName: String, bio: String, uid: String) {
        self.name = name
        self.imageName = imageName
        self.bio = bio
        self.uid = uid
    }
    
    convenience init(name: String, imageName: String, bio: String, uid: String, instagram: String) {
        self.init(name: name, imageName: imageName, bio: bio, uid: uid)
        self.instagram = instagram
        
    }
}
