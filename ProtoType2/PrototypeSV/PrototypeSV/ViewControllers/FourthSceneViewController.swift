//
//  FourthSceneViewController.swift
//  PrototypeSV
//
//  Created by 강 태훈 on 1/17/24.
//

import UIKit
import WebKit

class FourthSceneViewController: ViewController {
    
    let imageView: UIImageView = {
        let image: UIImageView = UIImageView(image: UIImage(named: "FourthSceneImage"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "해리윤호와 태훈님의 돌"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)
        ]
        
        buildInterface()
    }
    
    
    func buildInterface() {
        let safeArea: UILayoutGuide = view.safeAreaLayoutGuide
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: -100.0),
            imageView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
        
        let webView: WKWebView = WKWebView(frame: CGRect(x: 0, y: 100, width: Int(view.frame.width), height: 180))
        
        view.addSubview(webView)
        
        let urlString: String = "https://www.youtube.com/embed/dlSkyNLOncY?si=_3rNXJGII6TbwHvE"
        
        let url: URL = URL(string: urlString)!
        
        let urlRequset: URLRequest = URLRequest(url: url)
        
        webView.load(urlRequset)
        
    }
    


}
