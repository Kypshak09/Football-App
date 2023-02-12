//
//  SquadInformationViewController.swift
//  Alaman
//
//  Created by Amir Zhunussov on 11.02.2023.
//

import UIKit
import SnapKit

class SquadInformationViewController: UIViewController {

    let identifier = "Squad"
    
    let request = SquadRequest()
    var squad = [Player]()
    var welcome = [Welcome]()
    
    let table: UITableView = {
        let table = UITableView()
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        table.delegate = self
        table.dataSource = self
        table.register(SquadCell.self, forCellReuseIdentifier: identifier)
        
        request.getSquad { result in
            self.welcome = result
            self.table.reloadData()
        }
        
        configureConstraint()
    }
    
    
    private func configureConstraint() {
        view.addSubview(table)
        table.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.width.height.equalToSuperview()
        }
    }
}

extension SquadInformationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return welcome[section].squad[section].players.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return welcome.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! SquadCell
        let player = welcome[indexPath.section].squad[indexPath.row].players[indexPath.row]
        cell.label.text = player.name
        return cell
    }
    
    
}
