//
//  SceneDelegate.swift
//  JackflixCodeUI
//
//  Created by dopamint on 6/5/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        let firstVc = UINavigationController(rootViewController: MainViewController())
        let secondVc = UINavigationController(rootViewController: LoginViewController())
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([firstVc, secondVc], animated: true)
        
        if let items = tabBarController.tabBar.items {
            items[0].selectedImage = UIImage(systemName: "popcorn.fill")
            items[0].image = UIImage(systemName: "popcorn")
            items[0].title = "메인"  
            
            items[1].selectedImage = UIImage(systemName: "person.fill")
            items[1].image = UIImage(systemName: "person")
            items[1].title = "로그인"
        }
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

