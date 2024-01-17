//
//  SearchViewController.swift
//  PrototypeSV
//
//  Created by 이우석 on 1/17/24.
//

import UIKit

class SearchViewController: ViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = ""
        
        buildInterface()
    }
    
    let searchField: UITextField = {
        let textField: UITextField = UITextField()
        textField.placeholder = "검색"
        textField.textAlignment = .left
        textField.textColor = .white
        textField.backgroundColor = .black
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "NewSearch.png")
        // imageView.frame = CGRect(x: 0, y: 0, width: 400, height: 860)
        // imageView.frame.size.width = 400
        // imageView.frame.size.height = 750
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let searchButton: UIButton = {
        let button: UIButton = UIButton()
        button.setTitle("검색", for: .normal)
        return button
    }()
    
    let selectButton: UIButton = {
        let button: UIButton = UIButton()
        button.backgroundColor = .none
        button.frame = CGRect(x: 15, y: 165, width: 160, height: 230)
        return button
    }()
    
    func buildInterface() {
        let safeArea: UILayoutGuide = view.safeAreaLayoutGuide
        
        view.addSubview(imageView)
        imageView.isHidden = true
        
        let stackView: UIStackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 20
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        searchButton.addTarget(self, action: #selector(search), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 35.0),
            imageView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            imageView.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: safeArea.rightAnchor),
            
            stackView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            stackView.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 20),
            stackView.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -20)
        ])
        
        stackView.addArrangedSubview(searchField)
        stackView.addArrangedSubview(searchButton)
        
        view.addSubview(selectButton)
        
        selectButton.addTarget(self, action: #selector(selectMovie), for: .touchUpInside)
        selectButton.isHidden = true
    }

    @objc func search() {
        if searchField.hasText{
            self.imageView.isHidden = false
            self.selectButton.isHidden = false
        } else{
            self.imageView.isHidden = true
            self.selectButton.isHidden = true
        }
        
        searchField.resignFirstResponder()
    }
    
    @objc func selectMovie() {
        let nextViewController = FourthSceneViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
