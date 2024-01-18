//
//  WatchMovieViewController.swift
//  PrototypeSV
//
//  Created by 김성민 on 1/18/24.
//

import UIKit
import WebKit

class FourthSceneViewController: UIViewController {
    
    let harryPotterPosters: [String] = ["HarryPotter1", "harryPotter2", "harryPotter3", "harryPotter4", "harryPotter5", "harryPotter6", "harryPotter7"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "해리포터와 마법사의 돌"

        setLayout()
    }
    
    func setLayout() {
        let safeArea: UILayoutGuide = view.safeAreaLayoutGuide
        
        // WebView - 예고편 띄우기
        let webView: WKWebView = WKWebView()
        let urlString: String = "https://www.youtube.com/embed/dlSkyNLOncY?si=_3rNXJGII6TbwHvE"
        let url: URL = URL(string: urlString)!
        let urlRequset: URLRequest = URLRequest(url: url)
        webView.load(urlRequset)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        // ScrollView - WebView를 제외한 나머지 컨텐츠 담기
        let mainScrollView = UIScrollView()
        mainScrollView.backgroundColor = .systemPink
        mainScrollView.contentSize = CGSize(width: Int(view.frame.width), height: 800)
        
        // MainStackView
        let mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.distribution = .fill
        mainStackView.spacing = 10
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(webView)
        mainStackView.addArrangedSubview(mainScrollView)
        
        // Label - 작품 1줄 설명
        let summaryWorkLabel = UILabel()
        summaryWorkLabel.text = "마법사의 전설이 시작된다."
        summaryWorkLabel.font = .systemFont(ofSize: 30, weight: .bold)
        
        // Label - 작품 디테일 설명
        let detailWorkLabel = UILabel()
        detailWorkLabel.numberOfLines = 0
        detailWorkLabel.text = "평점: 8.5 / 10\n\n개봉일: 2001. 11.\n\n감독: 크리스 콜럼버스\n\n출연진: 다니엘 레드클리프, 엠마 왓슨, 이선준 외"
        detailWorkLabel.font = .systemFont(ofSize: 15, weight: .bold)
        
        // Label - 작품 시리즈 포스터
        let posterLabel = UILabel()
        posterLabel.text = "해리포터의 정주행 순서"
        posterLabel.font = .systemFont(ofSize: 30, weight: .bold)
        
        // ScrollView - Poster 담기 위한 ScrollView
        let posterScrollView = UIScrollView()
        posterScrollView.backgroundColor = .gray
        posterScrollView.contentSize = CGSize(width: 1040, height: 80)
        posterScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        for index in 0..<harryPotterPosters.count {
            let imageView = UIImageView()
            imageView.backgroundColor = .red
            imageView.image = UIImage(named: harryPotterPosters[index])
            imageView.frame = CGRect(x: 0 + (150 * index), y: 0, width: 140, height: 180)
            posterScrollView.addSubview(imageView)
        }
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "gamsangpyung")
        imageView.backgroundColor = .brown
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        // SubStackView
        let subStackView = UIStackView()
        subStackView.axis = .vertical
        subStackView.alignment = .fill
        subStackView.distribution = .fill
        subStackView.spacing = 10
        subStackView.backgroundColor = .blue
        subStackView.frame = CGRect(x: 0, y: 0, width: Int(view.frame.width), height: 620)
        
        subStackView.addArrangedSubview(summaryWorkLabel)
        subStackView.addArrangedSubview(detailWorkLabel)
        subStackView.setCustomSpacing(30, after: detailWorkLabel)
        subStackView.addArrangedSubview(posterLabel)
        subStackView.addArrangedSubview(posterScrollView)
        subStackView.setCustomSpacing(30, after: posterScrollView)
        subStackView.addArrangedSubview(imageView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            posterScrollView.heightAnchor.constraint(equalToConstant: 180),
            
            imageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    
        mainScrollView.addSubview(subStackView)
    }
}
