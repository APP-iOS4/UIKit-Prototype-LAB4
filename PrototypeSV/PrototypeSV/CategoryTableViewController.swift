//
//  CategoryTableViewController.swift
//  PrototypeSV
//
//  Created by 김성민 on 1/17/24.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    let categories: [String] = [
        "한국 영화",
        "외국 영화",
        "애니메이션",
        "드라마",
        "다큐멘터리",
        "액션",
        "공포",
        "성인 레이싱",
        "느와르",
        "로맨스",
        "코미디",
        "김성민",
        "가족",
        "키즈",
        "오늘 점심 뭐 먹지?",
        "오늘 저녁 뭐 먹지?",
        "주말에 뭐하지?",
        "로또 당첨 언제 되는거야...?",
        "협동 작업 재밌다!"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "카테고리"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)
        ]
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = "\(categories[indexPath.row])"
        
        // MARK: - 앱의 배경색깔과 맞춰줘야 함!!!
        content.textProperties.color = .white
        cell.backgroundColor = .systemGray
        
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        cell.contentConfiguration = content
        
        return cell
    }
}
