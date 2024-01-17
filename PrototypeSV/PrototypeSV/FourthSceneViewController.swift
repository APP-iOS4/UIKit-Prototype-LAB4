//
//  FourthSceneViewController.swift
//  PrototypeSV
//
//  Created by 강 태훈 on 1/17/24.
//

import UIKit

class FourthSceneViewController: UIViewController {
    
    let imageView: UIImageView = {
        let image: UIImageView = UIImageView(image: UIImage(named: "FourthSceneImage"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
        
        buildInterface()
    }
    
    
    func buildInterface() {
        let safeArea: UILayoutGuide = view.safeAreaLayoutGuide
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 900),
            
        
        ])
    }
    


}
