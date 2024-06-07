//
//  SceneDelegate.swift
//  JackflixCodeUI
//
//  Created by dopamint on 6/5/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    // TODO: 커스텀 탭바 컨트롤러 만들어서 분리시키기
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        
        // MARK: 탭바 컨트롤러를 구성하는 두가지 방법 -
        let firstVC = UINavigationController(rootViewController: MainViewController())
        let secondVC = LoginViewController()
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([firstVC, secondVC], animated: true)
        tabBarController.tabBar.tintColor = UIColor(named: "keyColor")
        tabBarController.tabBar.unselectedItemTintColor = .lightGray
        
        if let items = tabBarController.tabBar.items {
            items[0].selectedImage = UIImage(systemName: "popcorn.fill")
            items[0].image = UIImage(systemName: "popcorn")
            items[0].title = "홈"
            
            items[1].selectedImage = UIImage(systemName: "person.fill")
            items[1].image = UIImage(systemName: "person")
            items[1].title = "로그인"
        }
        
        // MARK: UIViewController가 기본적으로 tabBarItem을 가지고 있어 tabBarController에 들어가기 전에 미리 itme을 설정할 수 있다 -
        //        let firstVC = UINavigationController(rootViewController: MainViewController())
        //        firstVC.tabBarItem = UITabBarItem(
        //            title: "홈",
        //            image: UIImage(systemName: "popcorn"),
        //            selectedImage: UIImage(systemName: "popcorn.fill")
        //        )
        //
        //        let secondVC = LoginViewController()
        //        secondVC.tabBarItem = UITabBarItem(
        //            title: "로그인",
        //            image: UIImage(systemName: "person"),
        //            selectedImage: UIImage(systemName: "person.fill")
        //        )
        //
        //        tabBarController.viewControllers = [firstVC, secondVC]
        
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

