//
//  SquadInformationViewController.swift
//  Alaman
//
//  Created by Amir Zhunussov on 11.02.2023.
//

import UIKit
import SnapKit

class SquadInformationViewController: UIViewController {
    
    var cellDelegate: CellDelegate?

    let identifier = "Squad"

    var players = [Player]()
    
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
        navigationController?.navigationBar.tintColor = .black
        
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
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! SquadCell
        cell.label.text = players[indexPath.row].name
        return cell
    }
    
}
