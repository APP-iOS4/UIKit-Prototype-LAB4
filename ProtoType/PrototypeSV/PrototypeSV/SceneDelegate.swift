//
//  SceneDelegate.swift
//  PrototypeSV
//
//  Created by 이선준 on 1/17/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        
        
        // homeviewController
        let homeViewController = HomeViewController()
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        homeNavigationController.navigationBar.tintColor = .white
        homeNavigationController.tabBarItem.tag = 0
        
        // searchViewController
        let searchViewController = SearchViewController()
        let searchNavigationController = UINavigationController(rootViewController: searchViewController)
        searchNavigationController.navigationBar.tintColor = .white
        searchNavigationController.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 3)
        
        // recentViewController
        let historyViewController = HistoryViewController()
        let historyNavigationController = UINavigationController(rootViewController: historyViewController)
        historyNavigationController.navigationBar.tintColor = .white
        historyNavigationController.tabBarItem = UITabBarItem(title: "내 기록", image: UIImage(systemName: "person.crop.circle.badge.clock.fill"), tag: 1)
        
        // categoryTableViewController
        let categoryTableViewController = CategoryTableViewController()
        let categoryNavigationController = UINavigationController(rootViewController: categoryTableViewController)
        categoryNavigationController.tabBarItem = UITabBarItem(title: "카테고리", image: UIImage(systemName: "list.bullet"), tag: 2)
        
        // tab bar
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = UIColor(red: 131/255, green: 213/255, blue: 236/255, alpha: 1)
        tabBarController.viewControllers = [
            homeNavigationController,
            categoryNavigationController,
            historyNavigationController,
            searchNavigationController,
        ]
        
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }
}

