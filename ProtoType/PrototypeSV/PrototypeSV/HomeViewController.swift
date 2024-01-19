//
//  HomeViewController.swift
//  PrototypeSV
//
//  Created by 하윤호 on 1/17/24.
//

import UIKit

class HomeViewController: ViewController {
 
    let hotContents: [String] = ["starWars", "avengers", "avatar", "doctorWho", "CSI", "mentalist"]
    let movies: [String] = ["HarryPotter1", "toyStory", "spiderman", "transformer", "caribbean", "cooperate"]
    let dramas: [String] = ["squidGame", "doctor", "kimsabu", "Friends", "sweetHome", "walkingDead", "respond"]
    
    let miniScrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        
        let image = UIImage(named: "logo")
        imageView.image = image
        
        navigationItem.titleView = imageView
        
        buildInterface()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let appearance = UINavigationBarAppearance()
        appearance.titlePositionAdjustment = UIOffset(horizontal: -(view.frame.width/2), vertical: 0)
        
        UIView.animate(withDuration: 2.5) {
            self.miniScrollView.contentOffset = CGPoint(x: 280 * 5, y: 0)
        }
    }
    
    func buildInterface() {
        let safeArea: UILayoutGuide = view.safeAreaLayoutGuide
  
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1000)
        
        // 스크롤 뷰 오프셋 지정 후 애니메이션 지정하면 넷플릭스 메인 화면처럼 구성할 수있다.
        
        let contentStackView = UIStackView()
        contentStackView.axis = .vertical
        contentStackView.spacing = 10
        
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10),
            contentStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10)
        ])
        
        // contentStackView 안쪽 내용들
        // MARK: - First Cell
        let label = UILabel()
        label.text = "최근 핫한 컨텐츠들!"
        label.font = UIFont.systemFont(ofSize: 23.0, weight: .bold)
        label.textColor = .white
        contentStackView.addArrangedSubview(label)
        
        miniScrollView.contentSize = CGSize(width: 300 * (hotContents.count), height: 400)
        miniScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let recommendStackView = UIStackView()
        recommendStackView.axis = .horizontal
        recommendStackView.spacing = 10
        recommendStackView.translatesAutoresizingMaskIntoConstraints = false
        miniScrollView.addSubview(recommendStackView)
        
        for hotContent in hotContents {
            let imageView = UIImageView()
            imageView.image = UIImage(named: hotContent)
            
            NSLayoutConstraint.activate([
                imageView.widthAnchor.constraint(equalToConstant: 300),
                imageView.heightAnchor.constraint(equalToConstant: 400)
            ])

            recommendStackView.addArrangedSubview(imageView)
        }
        
        // 이미지 위에 덧씌워질 가상의 투명한 버튼
        let button = UIButton()
        button.backgroundColor = .clear
        button.frame = CGRect(x: 0, y: 0, width: 300 * (hotContents.count), height: 400)
        button.addTarget(self, action: #selector(goToMovieScene), for: .touchUpInside)
        miniScrollView.addSubview(button)
        
        NSLayoutConstraint.activate([
            miniScrollView.widthAnchor.constraint(equalToConstant: 3000),
            miniScrollView.heightAnchor.constraint(equalToConstant: 400)
        ])
        
        contentStackView.addArrangedSubview(miniScrollView)
        contentStackView.setCustomSpacing(40, after: miniScrollView)
        
        // MARK: - Second Cell
        let label2 = UILabel()
        label2.text = "요즘 대세 영화... 이게 MZ다"
        label2.font =  UIFont.systemFont(ofSize: 23.0, weight: .bold)
        label2.textColor = .white
        contentStackView.addArrangedSubview(label2)
        
        let miniScrollView2 = UIScrollView()
        miniScrollView2.backgroundColor = .clear
        miniScrollView2.contentSize = CGSize(width: 150 * movies.count, height: 180)
        miniScrollView2.translatesAutoresizingMaskIntoConstraints = false
        
        let movieStackView = UIStackView()
        movieStackView.axis = .horizontal
        movieStackView.spacing = 10
        movieStackView.translatesAutoresizingMaskIntoConstraints = false
        miniScrollView2.addSubview(movieStackView)
        
        for movie in movies {
            let imageView = UIImageView()
            imageView.image = UIImage(named: movie)
            
            NSLayoutConstraint.activate([
                imageView.widthAnchor.constraint(equalToConstant: 130),
                imageView.heightAnchor.constraint(equalToConstant: 180)
            ])

            movieStackView.addArrangedSubview(imageView)
        }

        // 이미지 위에 덧씌워질 가상의 투명한 버튼
        let button2 = UIButton()
        button2.backgroundColor = .clear
        button2.frame = CGRect(x: 0, y: 0, width: 150 * movies.count, height: 180)
        button2.addTarget(self, action: #selector(goToMovieScene), for: .touchUpInside)
        miniScrollView2.addSubview(button2)
        
        miniScrollView2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            miniScrollView2.widthAnchor.constraint(equalToConstant: view.frame.width),
            miniScrollView2.heightAnchor.constraint(equalToConstant: 180)
        ])
        
        
        contentStackView.addArrangedSubview(miniScrollView2)
        
        // MARK: - Third Cell
        let label3 = UILabel()
        label3.text = "드라마? 함 들라 마!"
        label3.font =  UIFont.systemFont(ofSize: 23.0, weight: .bold)
        label3.textColor = .white
        contentStackView.addArrangedSubview(label3)

        let miniScrollView3 = UIScrollView()
        miniScrollView3.backgroundColor = .clear
        miniScrollView3.contentSize = CGSize(width:  150 * dramas.count, height: 180)
        miniScrollView3.translatesAutoresizingMaskIntoConstraints = false
        
        let dramaStackView = UIStackView()
        dramaStackView.axis = .horizontal
        dramaStackView.spacing = 10
        dramaStackView.translatesAutoresizingMaskIntoConstraints = false
        miniScrollView3.addSubview(dramaStackView)
        
        for drama in dramas {
            let imageView = UIImageView()
            imageView.image = UIImage(named: drama)
            
            NSLayoutConstraint.activate([
                imageView.widthAnchor.constraint(equalToConstant: 130),
                imageView.heightAnchor.constraint(equalToConstant: 180)
            ])

            dramaStackView.addArrangedSubview(imageView)
        }
        
        // 이미지 위에 덧씌워질 가상의 투명한 버튼
        let button3 = UIButton()
        button3.backgroundColor = .clear
        button3.frame = CGRect(x: 0, y: 0, width: 150 * dramas.count, height: 180)
        button3.addTarget(self, action: #selector(goToMovieScene), for: .touchUpInside)
        miniScrollView3.addSubview(button3)
        
        miniScrollView3.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            miniScrollView3.widthAnchor.constraint(equalToConstant: 350),
            miniScrollView3.heightAnchor.constraint(equalToConstant: 180)
        ])
        
        contentStackView.setCustomSpacing(25, after: miniScrollView2)
        contentStackView.addArrangedSubview(miniScrollView3)
    }
    
    
    // MARK: - @objc function
    @objc func goToMovieScene() {
        let nextViewController = FourthSceneViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
