//
//  MatchingCards.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 5/2/21.
//

// 1
import SwiftUI
import FirebaseCore
import FirebaseFirestore

struct MatchingCards {
    var name: [String]
    var age: [String]
    var grade: [String]
    var major: [String]
    var bio: [String]
}
var new: MatchingCards?

var db: Firestore?


func profileInfo() {
    
//        ref = db?.collection("users").get]Document()
   db?.collection("users").getDocuments() { [] (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            
            
            for document in querySnapshot!.documents {
//                    document.data()["Name"]
                print("----------------------------------")
                
                new?.name.append("\(document.data()["Name"])")
                new?.age.append("\(document.data()["age"])")
                new?.grade.append("\(document.data()["grade"])")
                new?.major.append("\(document.data()["major"])")
                new?.bio.append("\(document.data()["bio"])")
//                image.append("\(document.data()["image"])")
                print("----------------------------------")
                                }
        }

    }
}
    


extension MatchingCards {
   
    static var data: [MatchingCards] {
        profileInfo()
        
        return [
        
            MatchingCards(name: ["Name"], age: ["age"], grade: ["grade"], major: ["major"], bio: ["bio"]),
            MatchingCards(name: [""], age: [""], grade:[ ""], major: [""], bio: [""]),
            MatchingCards(name: [""], age: [""], grade: [""], major: [""], bio: [""])
        ]
//        var new: MatchingCards
    }
}
