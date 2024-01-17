//
//  HomeViewController.swift
//  PrototypeSV
//
//  Created by 하윤호 on 1/17/24.
//

import UIKit

class HomeViewController: ViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = "하윤호님 반갑습니다."
        self.navigationController?.hidesBarsOnSwipe = true
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)
        ]
        
        buildInterface()
    }
    
    func buildInterface() {
        let safeArea: UILayoutGuide = view.safeAreaLayoutGuide
  
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: 2500)
        
        let contentStackView = UIStackView()
        contentStackView.axis = .vertical
        contentStackView.spacing = 20
        
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentStackView)
        
        // contentStackView 안쪽 내용들
        
        // MARK: - First Cell
        let label = UILabel()
        label.text = "가장 검색을 많이 했던 영화"
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        contentStackView.addArrangedSubview(label)
        
        let miniScrollView = UIScrollView()
        miniScrollView.backgroundColor = .clear
        miniScrollView.contentSize = CGSize(width: 825, height: 200)
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "searchImage")
        imageView.frame = CGRect(x: 0, y: 0, width:825, height: 200)
        miniScrollView.addSubview(imageView)
        
        // 이미지 위에 덧씌워질 가상의 투명한 버튼
        let button = UIButton()
        button.backgroundColor = .clear
//        button.alpha = 0.35
        button.frame = CGRect(x: 0, y: 0, width:825, height: 200)
        button.addTarget(self, action: #selector(goToMovieScene), for: .touchUpInside)
        miniScrollView.addSubview(button)
        
        miniScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            miniScrollView.widthAnchor.constraint(equalToConstant: 350),
            miniScrollView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        contentStackView.addArrangedSubview(miniScrollView)
        
        contentStackView.setCustomSpacing(30, after: miniScrollView)
        
        // MARK: - Second Cell
        let label2 = UILabel()
        label2.text = "요즘 대세 영화... 이게 MZ다"
        label2.font = UIFont.preferredFont(forTextStyle: .title2)
        contentStackView.addArrangedSubview(label2)
        
        let miniScrollView2 = UIScrollView()
        miniScrollView2.backgroundColor = .clear
        miniScrollView2.contentSize = CGSize(width: 825, height: 200)
        
        let imageView2 = UIImageView()
        imageView2.image = UIImage(named: "MZImage")
        imageView2.frame = CGRect(x: 0, y: 0, width: 825, height: 200)
        miniScrollView2.addSubview(imageView2)
        
        // 이미지 위에 덧씌워질 가상의 투명한 버튼
        let button2 = UIButton()
        button2.backgroundColor = .clear
//        button.alpha = 0.35
        button2.frame = CGRect(x: 0, y: 0, width: 825, height: 150)
        button2.addTarget(self, action: #selector(goToMovieScene), for: .touchUpInside)
        miniScrollView2.addSubview(button2)
        
        miniScrollView2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            miniScrollView2.widthAnchor.constraint(equalToConstant: 350),
            miniScrollView2.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        contentStackView.addArrangedSubview(miniScrollView2)
        
        contentStackView.setCustomSpacing(30, after: miniScrollView2)
        
        // MARK: - Third Cell
        let label3 = UILabel()
        label3.text = "이걸 끝까지 안봐? 이걸 참아?"
        label3.font = UIFont.preferredFont(forTextStyle: .title2)
        contentStackView.addArrangedSubview(label3)

        let miniScrollView3 = UIScrollView()
        miniScrollView3.backgroundColor = .clear
        miniScrollView3.contentSize = CGSize(width: 825, height: 200)
        miniScrollView3.frame = CGRect(x: 0, y: 0, width:300, height: 200)
        
        let imageView3 = UIImageView()
        imageView3.image = UIImage(named: "recommend")
        imageView3.frame = CGRect(x: 0, y: 0, width: 825, height: 200)
        miniScrollView3.addSubview(imageView3)
        
        // 이미지 위에 덧씌워질 가상의 투명한 버튼
        let button3 = UIButton()
        button3.backgroundColor = .clear
//        button.alpha = 0.35
        button3.frame = CGRect(x: 0, y: 0, width: 825, height: 200)
        button3.addTarget(self, action: #selector(goToMovieScene), for: .touchUpInside)
        miniScrollView3.addSubview(button3)
        
        miniScrollView3.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            miniScrollView3.widthAnchor.constraint(equalToConstant: 350),
            miniScrollView3.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        contentStackView.addArrangedSubview(miniScrollView3)
        
        contentStackView.setCustomSpacing(30, after: miniScrollView3)
    }
    
    
    // MARK: - @objc function
    @objc func goToMovieScene() {
        let nextViewController = FourthSceneViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
