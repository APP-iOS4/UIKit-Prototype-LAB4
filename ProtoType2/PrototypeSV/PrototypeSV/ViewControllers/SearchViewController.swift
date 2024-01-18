//
//  SearchingViewController.swift
//  PrototypeSV
//
//  Created by 이우석 on 1/17/24.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = "검색어를 입력하세요."
        
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        
        buildInterface()
    }
    
    let scrollView: UIScrollView = {
        let sv: UIScrollView = UIScrollView()
        sv.backgroundColor = UIColor(red: 39/255, green: 39/255, blue: 39/255, alpha: 1)
        return sv
    }()
    
    
    let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
    
    let searchField: UITextField = {
        let textField: UITextField = UITextField()
        // textField.placeholder = "검색어를 입력해 주세요"
        textField.textAlignment = .left
        textField.textColor = .white
        textField.backgroundColor = .black
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let searchButton: UIButton = {
        let button: UIButton = UIButton()
        button.setTitle("검색", for: .normal)
        return button
    }()
    
    let selectButton: UIButton = {
        let button: UIButton = UIButton()
        button.backgroundColor = .clear
        button.frame = CGRect(x: 0, y: 0, width: 190, height: 250)
        return button
    }()
    
    let label1: UILabel = {
        let label: UILabel = UILabel()
        label.text = "해리포터 스토리 정주행"
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title2)
        label.textAlignment = .left
        return label
    }()
    
    let label2: UILabel = {
        let label: UILabel = UILabel()
        label.text = "판타지를 원하세요?"
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title2)
        label.textAlignment = .left
        return label
    }()
    
    let label3: UILabel = {
        let label: UILabel = UILabel()
        label.text = "또 다른 시리즈 영화"
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title2)
        label.textAlignment = .left
        return label
    }()
    
    let label4: UILabel = {
        let label: UILabel = UILabel()
        label.text = "이건 어떠세요?"
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title2)
        label.textAlignment = .left
        return label
    }()
    
    let miniScrollView: UIScrollView = {
        let scroll: UIScrollView = UIScrollView()
        scroll.backgroundColor = .clear
        scroll.contentSize = CGSize(width: 550, height: 250)
        return scroll
    }()
    
    let subScrollView1: UIScrollView = {
        let scroll: UIScrollView = UIScrollView()
        scroll.backgroundColor = .clear
        scroll.contentSize = CGSize(width: 550, height: 200)
        return scroll
    }()
    
    let subScrollView2: UIScrollView = {
        let scroll: UIScrollView = UIScrollView()
        scroll.backgroundColor = .clear
        scroll.contentSize = CGSize(width: 550, height: 200)
        return scroll
    }()
    
    let subScrollView3: UIScrollView = {
        let scroll: UIScrollView = UIScrollView()
        scroll.backgroundColor = .clear
        scroll.contentSize = CGSize(width: 550, height: 200)
        return scroll
    }()
    
    
    func buildInterface() {
        
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1100)
        
        
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentStackView)
        
        // contentStackView 안쪽 내용들
        
        let searchBar: UIStackView = UIStackView()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.axis = .horizontal
        searchBar.alignment = .center
        searchBar.spacing = 20
        
        searchBar.addArrangedSubview(searchField)
        searchBar.addArrangedSubview(searchButton)
        
        contentStackView.addArrangedSubview(searchBar)
        
        contentStackView.addArrangedSubview(label1)
        
        
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Search1.png")
        imageView.frame = CGRect(x: 0, y: 0, width:550, height: 250)
        miniScrollView.addSubview(imageView)
        
        // 이미지 위에 덧씌워질 가상의 투명한 버튼
        
        miniScrollView.addSubview(selectButton)
        
        miniScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            searchBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            miniScrollView.widthAnchor.constraint(equalToConstant: view.frame.width),
            miniScrollView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        contentStackView.addArrangedSubview(miniScrollView)
        
        
        subScrollView1.translatesAutoresizingMaskIntoConstraints = false
        subScrollView2.translatesAutoresizingMaskIntoConstraints = false
        subScrollView3.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView1 = UIImageView()
        imageView1.image = UIImage(named: "Search2")
        imageView1.frame = CGRect(x: 0, y: 0, width:550, height: 200)
        subScrollView1.addSubview(imageView1)
        
        let imageView2 = UIImageView()
        imageView2.image = UIImage(named: "Search3")
        imageView2.frame = CGRect(x: 0, y: 0, width:550, height: 200)
        subScrollView2.addSubview(imageView2)
        
        let imageView3 = UIImageView()
        imageView3.image = UIImage(named: "Search4")
        imageView3.frame = CGRect(x: 0, y: 0, width:550, height: 200)
        subScrollView3.addSubview(imageView3)
        
        NSLayoutConstraint.activate([
            label1.widthAnchor.constraint(equalToConstant: view.frame.width),
            label2.widthAnchor.constraint(equalToConstant: view.frame.width),
            label3.widthAnchor.constraint(equalToConstant: view.frame.width),
            label4.widthAnchor.constraint(equalToConstant: view.frame.width),
            subScrollView1.widthAnchor.constraint(equalToConstant: view.frame.width),
            subScrollView1.heightAnchor.constraint(equalToConstant: 200),
            subScrollView2.widthAnchor.constraint(equalToConstant: view.frame.width),
            subScrollView2.heightAnchor.constraint(equalToConstant: 200),
            subScrollView3.widthAnchor.constraint(equalToConstant: view.frame.width),
            subScrollView3.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        contentStackView.addArrangedSubview(label2)
        contentStackView.addArrangedSubview(subScrollView1)
        contentStackView.addArrangedSubview(label3)
        contentStackView.addArrangedSubview(subScrollView2)
        contentStackView.addArrangedSubview(label4)
        contentStackView.addArrangedSubview(subScrollView3)
        
        searchButton.addTarget(self, action: #selector(search), for: .touchUpInside)
        selectButton.addTarget(self, action: #selector(selectMovie), for: .touchUpInside)
        
        self.selectButton.isHidden = true
        self.label1.isHidden = true
        self.label2.isHidden = true
        self.label3.isHidden = true
        self.label4.isHidden = true
        self.miniScrollView.isHidden = true
        self.subScrollView1.isHidden = true
        self.subScrollView2.isHidden = true
        self.subScrollView3.isHidden = true
    }
    
    @objc func search() {
        if searchField.hasText{
            self.selectButton.isHidden = false
            self.label1.isHidden = false
            self.label2.isHidden = false
            self.label3.isHidden = false
            self.label4.isHidden = false
            self.miniScrollView.isHidden = false
            self.subScrollView1.isHidden = false
            self.subScrollView2.isHidden = false
            self.subScrollView3.isHidden = false
            
        } else{
            self.selectButton.isHidden = true
            self.label1.isHidden = true
            self.label2.isHidden = true
            self.label3.isHidden = true
            self.label4.isHidden = true
            self.miniScrollView.isHidden = true
            self.subScrollView1.isHidden = true
            self.subScrollView2.isHidden = true
            self.subScrollView3.isHidden = true
        }
        
        searchField.resignFirstResponder()
    }
    
    @objc func selectMovie() {
        let nextViewController = FourthSceneViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

#Preview("SearchViewController"){
    SearchViewController()
}
