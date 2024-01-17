//
//  HomeViewController.swift
//  PrototypeSV
//
//  Created by 하윤호 on 1/17/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    let imageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.image = UIImage(named: "Edited.002")
        imageView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        return imageView
    }()

    let harryPoterButton: UIButton = {
        let button: UIButton = UIButton()
//        button.setTitle("해리포터", for: .normal)
//        button.backgroundColor = .systemCyan
        button.frame = CGRect(x: 250, y: 390, width: 110, height: 150)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemGray5
        
        buildInterface()
    }
    
    func buildInterface() {
        let safeArea: UILayoutGuide = view.safeAreaLayoutGuide
        
        self.view.addSubview(imageView)
        self.view.addSubview(harryPoterButton)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: -110),
            imageView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
        ])
        
        harryPoterButton.addTarget(self, action: #selector(goToHarryPoter), for: .touchUpInside)
    }
    
    @objc func goToHarryPoter() {
        let nextViewController = TestViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
