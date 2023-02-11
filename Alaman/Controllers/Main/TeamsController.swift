//
//  TeamsController.swift
//  Alaman
//
//  Created by Amir Zhunussov on 22.01.2023.
//

import SnapKit
import UIKit

class TeamsController: UIViewController {
    
    let teamsArray = ["Alatau","Aqjayiq", "Aqsay united", "Astana slit", "Jez Grads", "Kokshetau", "Maiqudyk" , "Okzhetpes", "Pavlodar", "Qostanay", "Sapa Semey" , "Ulytau"]
    
    let identifier = "TeamCell"
    
    let tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    override func viewDidLoad() {
        title = "Teams"
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TeamsCell.self, forCellReuseIdentifier: identifier)
        tableView.separatorStyle = .none
        tableView.bounces = false
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
}

extension TeamsController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! TeamsCell
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor(red: 0.941, green: 0.955, blue: 0.97, alpha: 1)
        } else {
            cell.backgroundColor = .white
        }
        cell.name.text = teamsArray[indexPath.row]
        cell.image.image = UIImage(named: teamsArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}
