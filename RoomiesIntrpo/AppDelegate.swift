//
//  AppDelegate.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 3/16/21.
//

import UIKit
import FirebaseCore
import FirebaseFirestore


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

//    let db = Firestore.firestore()
//    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
               let db = Firestore.firestore()
               // [END default_firestore]
               print(db) // silence warning
//        let storage = Storage.storage()
//        let storageRef = storage.reference()
//        let profileRef = storageRef.child("\(ProfileViewController())")
//        let data = Data()

        // Override point for customization after application launch.
        return true
    }
    
    override init() {
        super.init()
       FirebaseApp.configure()
    }
  

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

