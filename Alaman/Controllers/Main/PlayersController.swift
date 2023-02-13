//
//  PlayersController.swift
//  Alaman
//
//  Created by Amir Zhunussov on 22.01.2023.
//

import Foundation
import UIKit
import SnapKit

class PlayersController: UIViewController {
    
    var array = [Goleadors]()
    
    private let identifier = "GoalCell"
    
    let table: UITableView = {
        let table = UITableView()
        return table
    }()
    
    override func viewDidLoad() {
        title = "Players"
        table.register(GoleadorsCell.self, forCellReuseIdentifier: identifier)
        table.delegate = self
        table.dataSource = self
        
        ScoreRequest.shared.getData { result in
            self.array = result
            self.table.reloadData()
            print(self.array)
        }
        
        configureConstraint()
    }
    
    private func configureConstraint() {
        view.addSubview(table)
        table.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalToSuperview()
        }
    }
    
}
extension PlayersController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! GoleadorsCell
        cell.name.text = array[indexPath.row].name
        cell.match.text = String(array[indexPath.row].goals)
        cell.team.text = array[indexPath.row].team
        cell.goal.text = String(array[indexPath.row].matches)
        return cell
    }
    
    
}
