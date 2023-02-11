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
    
    var arrayPlayer = [Player]()
    
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
        request.fetchWelcomeData { result in
            self.arrayPlayer = result.squad[1].players
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
        return arrayPlayer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! SquadCell
        cell.configure(player: arrayPlayer[indexPath.row])
        return cell
    }
    
    
}
