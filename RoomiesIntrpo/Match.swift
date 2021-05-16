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
    var age: String
    var grade: String
    var major: String
    var college: String
    
    
    
    
    init(name: String, imageName: String, bio: String, uid: String, age: String, grade: String, major: String, college: String) {
        self.name = name
        self.imageName = imageName
        self.bio = bio
        self.uid = uid
        self.age = age
        self.grade = grade
        self.major = major
        self.college = college
    }
    
    convenience init(name: String, imageName: String, bio: String, uid: String, age: String, grade: String, major: String, college: String, instagram: String) {
        self.init(name: name, imageName: imageName, bio: bio, uid: uid, age: age, grade: grade, major: major, college: college)
        self.instagram = instagram
        
    }
}
