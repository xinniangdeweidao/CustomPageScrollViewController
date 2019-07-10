//
//  ZLDepositTableViewController.swift
//  EYEE
//
//  Created by MacMini on 2019/7/10.
//  Copyright © 2019 zali. All rights reserved.
//

import UIKit

class ZLDepositTableViewController: UIViewController {
    lazy var tableV: UITableView = {
        let tableV = UITableView.init(frame: CGRect.zero, style: .grouped)
        tableV.separatorStyle = .none
        tableV.register(UITableViewCell.self, forCellReuseIdentifier: "666666")
        tableV.showsVerticalScrollIndicator = false
        tableV.backgroundColor = UIColor.white
        tableV.delegate = self
        tableV.dataSource = self
        if #available(iOS 11, *) {
            tableV.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        tableV.estimatedSectionHeaderHeight = 0.01

        return tableV
    }()
    
    var depositList: [String] = []
    var typeIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableV.frame = self.view.frame
        self.view.addSubview(tableV)

    }
}

//MARK: tableViewDelegate、tableViewdatasource
extension ZLDepositTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
        //return depositList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "666666", for: indexPath)
        cell.textLabel?.text = "当前是：第\(typeIndex)个"
        return cell
    }
    
    
}

