//
//  ViewController.swift
//  PrototypeSV
//
//  Created by 이선준 on 1/17/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(red: 39/255, green: 39/255, blue: 39/255, alpha: 1)
        
        // 탭바 다크 모드 발동!!!!!
        tabBarController!.tabBar.barStyle = .black

        // 네비바 다크모드!
        navigationController!.navigationBar.barStyle = .black
        
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    // 빠른 포기~

}

