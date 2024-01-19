//
//  RecentViewController.swift
//  PrototypeSV
//
//  Created by 이선준 on 1/17/24.
//

import UIKit

class HistoryViewController: ViewController {
    
    let posterWidth: CGFloat = 130.0
    let posterHeight: CGFloat = 180.0
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = "하윤호님의 시청기록"
        // self.navigationController?.hidesBarsOnSwipe = true
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 27),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        
        buildInterface()
    }
    
    // MARK: - buildInterface()

    /**
     MainScrollView (Vertical)
     ├── MainStackView (Vertical)
     │       ├── CurrentContent (Poster)
     │       ├── StoppedContentsLabel (Label)
     │       ├── StoppedContentsScrollView (Horizontal)
     │       │       ├── StoppedContentsStackView (Horizontal)
     │       │       │       ├── StoppedContensPosters (Posters)
     │       ├── ContentsHistoryLabel (Label)
     │       ├── ContentsHistoryScrollView (Horizontal)
     │       │       ├── ContentsHistoryStackView (Horizontal)
     │       │       │       ├── ContentsHistoryPosters (Posters)
     */
    func buildInterface() {
        let safeArea: UILayoutGuide = view.safeAreaLayoutGuide
        
        // MARK: MainScrollView (Vertical)
        let mainScrollView: UIScrollView = {
            let scroll: UIScrollView = UIScrollView()
            scroll.contentSize = CGSize(width: safeArea.layoutFrame.width, height: 750.0)
            scroll.translatesAutoresizingMaskIntoConstraints = false
            return scroll
        }()
        self.view.addSubview(mainScrollView)
        NSLayoutConstraint.activate([
            // MainScrollView
            mainScrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            mainScrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
        ])
        
        // MARK: MainStackView (Vertical)
        let mainStackView: UIStackView = {
            let stack: UIStackView = UIStackView()
            stack.axis = .vertical
            stack.spacing = 10.0
            stack.translatesAutoresizingMaskIntoConstraints = false
            return stack
        }()
        mainScrollView.addSubview(mainStackView)
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: mainScrollView.topAnchor, constant: 20.0),
            mainStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
        ])
        
        // MARK: CurrentContent (Poster)
        let currentContent: UIButton = {
            // button
            let button: UIButton = UIButton()
            button.backgroundColor = .black
            button.addTarget(self, action: #selector(pushNavigationThisView), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            
            // imageView
            let imageView: UIImageView = UIImageView()
            imageView.image = UIImage(named: "HarryPotter1")
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            // progress
            let progress: UIProgressView = UIProgressView()
            progress.progress = 0.68
            progress.trackTintColor = UIColor(red: 50/255, green: 84/255, blue: 117/255, alpha: 1)
            progress.progressTintColor = UIColor(red: 131/255, green: 213/255, blue: 236/255, alpha: 1)
            progress.translatesAutoresizingMaskIntoConstraints = false
            
            button.addSubview(imageView)
            imageView.addSubview(progress)
            
            // layout
            NSLayoutConstraint.activate([
                imageView.centerXAnchor.constraint(equalTo: button.centerXAnchor),
                imageView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
                imageView.widthAnchor.constraint(equalToConstant: posterWidth),
                imageView.heightAnchor.constraint(equalToConstant: posterHeight),
                
                progress.leadingAnchor.constraint(equalTo: button.leadingAnchor),
                progress.trailingAnchor.constraint(equalTo: button.trailingAnchor),
                progress.bottomAnchor.constraint(equalTo: button.bottomAnchor),
                progress.heightAnchor.constraint(equalToConstant: 5.0),
            ])
            
            return button
        }()
        mainStackView.addArrangedSubview(currentContent)
        mainStackView.setCustomSpacing(40.0, after: currentContent)
        NSLayoutConstraint.activate([
            currentContent.widthAnchor.constraint(equalToConstant: safeArea.layoutFrame.width),
            currentContent.heightAnchor.constraint(equalToConstant: posterHeight + 5.0)
        ])
        
        // MARK: StoppedContentsLabel (Label)
        let stoppedContentsLabel: UILabel = {
            let label: UILabel = UILabel()
            label.text = "이어서 볼 컨텐츠"
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 23.0, weight: .bold)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        mainStackView.addArrangedSubview(stoppedContentsLabel)
        
        // MARK: StoppedContentsScrollView (Horizontal)
        let stoppedContentsScrollView: UIScrollView = {
            let scroll: UIScrollView = UIScrollView()
            scroll.contentSize = CGSize(width: posterWidth * 7.0, height: posterHeight)
            scroll.translatesAutoresizingMaskIntoConstraints = false
            return scroll
        }()
        mainStackView.addArrangedSubview(stoppedContentsScrollView)
        mainStackView.setCustomSpacing(40.0, after: stoppedContentsScrollView)
        NSLayoutConstraint.activate([
            stoppedContentsScrollView.widthAnchor.constraint(equalToConstant: safeArea.layoutFrame.width),
            stoppedContentsScrollView.heightAnchor.constraint(equalToConstant: posterHeight)
        ])
        
        // MARK: StoppedContentsStackView (Horizontal)
        let stoppedContentsStackView: UIStackView = {
            let stack: UIStackView = UIStackView()
            stack.axis = .horizontal
            stack.translatesAutoresizingMaskIntoConstraints = false
            return stack
        }()
        stoppedContentsScrollView.addSubview(stoppedContentsStackView)
        NSLayoutConstraint.activate([
            stoppedContentsStackView.leadingAnchor.constraint(equalTo: stoppedContentsScrollView.leadingAnchor),
            stoppedContentsStackView.topAnchor.constraint(equalTo: stoppedContentsScrollView.topAnchor),
        ])
        
        // MARK: StoppedContensPosters (Posters)
        let stoppedContentsPosters: [UIView] = {
            let posters: [String] = [
                "HarryPotter1",
                "harryPotter2",
                "harryPotter3",
                "harryPotter4",
                "harryPotter5",
                "harryPotter6",
                "harryPotter7",
            ]
            
            var buttons: [UIView] = []
            
            for poster in posters {
                let view: UIView = UIView()
                view.translatesAutoresizingMaskIntoConstraints = false
                
                let button: UIButton = UIButton()
                button.setImage(UIImage(named: poster), for: .normal)
                if poster == posters[0] {
                    button.addTarget(self, action: #selector(pushNavigationThisView), for: .touchUpInside)
                }
                button.translatesAutoresizingMaskIntoConstraints = false
                
                view.addSubview(button)
                
                NSLayoutConstraint.activate([
                    view.widthAnchor.constraint(equalToConstant: posterWidth),
                    view.heightAnchor.constraint(equalToConstant: posterHeight),
                    
                    button.widthAnchor.constraint(equalToConstant: posterWidth - 5.0),
                    button.heightAnchor.constraint(equalToConstant: posterHeight - 5.0),
                    button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                ])
                buttons.append(view)
            }
            return buttons
        }()
        for poster in stoppedContentsPosters {
            stoppedContentsStackView.addArrangedSubview(poster)
        }
        
        // MARK: ContentsHistoryLabel (Label)
        let contentsHistoryLabel: UILabel = {
            let label: UILabel = UILabel()
            label.text = "최근에 본 컨텐츠"
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 23.0, weight: .bold)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        mainStackView.addArrangedSubview(contentsHistoryLabel)
        
        // MARK: ContentsHistoryScrollView (Horizontal)
        let contentsHistoryScrollView: UIScrollView = {
            let scroll: UIScrollView = UIScrollView()
            scroll.contentSize = CGSize(width: posterWidth * 7.0, height: posterHeight)
            scroll.translatesAutoresizingMaskIntoConstraints = false
            return scroll
        }()
        mainStackView.addArrangedSubview(contentsHistoryScrollView)
        NSLayoutConstraint.activate([
            contentsHistoryScrollView.widthAnchor.constraint(equalToConstant: safeArea.layoutFrame.width),
            contentsHistoryScrollView.heightAnchor.constraint(equalToConstant: posterHeight)
        ])
        
        // MARK: ContentsHistoryStackView (Horizontal)
        let contentsHistoryStackView: UIStackView = {
            let stack: UIStackView = UIStackView()
            stack.axis = .horizontal
            stack.translatesAutoresizingMaskIntoConstraints = false
            return stack
        }()
        contentsHistoryScrollView.addSubview(contentsHistoryStackView)
        NSLayoutConstraint.activate([
            contentsHistoryStackView.leadingAnchor.constraint(equalTo: contentsHistoryScrollView.leadingAnchor),
            contentsHistoryStackView.topAnchor.constraint(equalTo: contentsHistoryScrollView.topAnchor),
        ])
        
        let contentsHistoryPosters: [UIView] = {
            let posters: [String] = [
                "HarryPotter1",
                "harryPotter2",
                "harryPotter3",
                "harryPotter4",
                "harryPotter5",
                "harryPotter6",
                "harryPotter7",
            ]
            
            var buttons: [UIView] = []
            
            for poster in posters {
                let view: UIView = UIView()
                view.translatesAutoresizingMaskIntoConstraints = false
                
                let button: UIButton = UIButton()
                button.setImage(UIImage(named: poster), for: .normal)
                if poster == posters[0] {
                    button.addTarget(self, action: #selector(pushNavigationThisView), for: .touchUpInside)
                }
                button.translatesAutoresizingMaskIntoConstraints = false
                
                view.addSubview(button)
                
                NSLayoutConstraint.activate([
                    view.widthAnchor.constraint(equalToConstant: posterWidth),
                    view.heightAnchor.constraint(equalToConstant: posterHeight),
                    
                    button.widthAnchor.constraint(equalToConstant: posterWidth - 5.0),
                    button.heightAnchor.constraint(equalToConstant: posterHeight - 5.0),
                    button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                ])
                buttons.append(view)
            }
            return buttons
        }()
        for poster in contentsHistoryPosters {
            contentsHistoryStackView.addArrangedSubview(poster)
        }
    }
    
    // MARK: - Objc Function
    @objc func pushNavigationThisView() {
        let nextViewController = FourthSceneViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
