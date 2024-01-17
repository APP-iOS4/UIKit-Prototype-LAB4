//
//  RecentViewController.swift
//  PrototypeSV
//
//  Created by 이선준 on 1/17/24.
//

import UIKit

class RecentViewController: UIViewController {
    // MARK: - make Elements
    
    let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "이어보기"
        label.font = .boldSystemFont(ofSize: 30.0)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageView: UIImageView = {
        let image: UIImageView = UIImageView(image: UIImage(named: "RecentSceneImage"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        buildInterface()
    }
    
    // MARK: - buildInterface()
    func buildInterface() {
        let safeArea: UILayoutGuide = view.safeAreaLayoutGuide
        
        // MARK: - imageView
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: -50.0),
            imageView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
        
        // MARK: - uilabel
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor),
        ])
        
    }
}
