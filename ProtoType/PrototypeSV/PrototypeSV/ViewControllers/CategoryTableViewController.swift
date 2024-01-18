//
//  ViewController.swift
//  CollectionUIKit
//
//  Created by 김성민 on 1/16/24.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    let dramaCategories: [String] = [
        "한국 드라마",
        "외국 드라마",
        "액션",
        "공포",
        "느와르",
        "로맨스",
        "코미디",
        "가족",
        "키즈"
    ]
    
    let movieCategories: [String] = [
        "한국 영화",
        "외국 영화",
        "다큐멘터리",
        "액션",
        "공포",
        "느와르",
        "로맨스",
        "코미디",
        "가족",
        "키즈",
    ]
    
    var indexNumber: Int = 0
    
    let segmentedControl = UISegmentedControl(items: ["드라마", "영화"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "카테고리"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        
        self.view.backgroundColor = UIColor(red: 39/255, green: 39/255, blue: 39/255, alpha: 1)
        
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        tableView.delegate = self
        tableView.dataSource = self

        tableView.tableHeaderView = segmentedControl
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            return dramaCategories.count
        case 1:
            return movieCategories.count
        default: break
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            content.text = "\(dramaCategories[indexPath.row])"
            content.textProperties.color = .white
            cell.backgroundColor = UIColor(red: 39/255, green: 39/255, blue: 39/255, alpha: 1)
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .none
            cell.contentConfiguration = content
            return cell
        case 1:
            content.text = "\(movieCategories[indexPath.row])"
            content.textProperties.color = .white
            cell.backgroundColor = UIColor(red: 39/255, green: 39/255, blue: 39/255, alpha: 1)
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .none
            cell.contentConfiguration = content
            return cell
        default: break
        }
           
        content.text = "\(dramaCategories[indexPath.row])"
        
        // MARK: - 앱의 배경색깔과 맞춰줘야 함!!!
        content.textProperties.color = .white
        cell.backgroundColor = UIColor(red: 39/255, green: 39/255, blue: 39/255, alpha: 1)
        
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        cell.contentConfiguration = content
        
        return cell
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl){
        switch sender.selectedSegmentIndex {
        case 0:
            tableView.reloadData()
            break
        case 1:
            tableView.reloadData()
            break
        default:
            break
        }
    }
}
