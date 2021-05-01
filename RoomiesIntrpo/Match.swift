//
//  Match.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 5/1/21.
//

import UIKit


class Match: NSObject {

    var name: String
    var imageName: String
    var bio: String
    init(name: String, imageName: String, bio: String) {
        self.name = name
        self.imageName = imageName
        self.bio = bio
    }
}
