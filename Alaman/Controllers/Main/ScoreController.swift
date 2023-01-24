//
//  ScoreController.swift
//  Alaman
//
//  Created by Amir Zhunussov on 22.01.2023.
//

import UIKit
import SnapKit
import SideMenu

class ScoreController: UIViewController {

    private var teamArray = [Models]()
    
    let viewOfTeams: UIView = {
        let view = UIView()
        return view
    }()
    
    let number: UILabel = {
        let label = UILabel()
        label.text = "#"
        return label
    }()
    
    let matches: UILabel = {
        let label = UILabel()
        label.text = "M"
        return label
    }()
    
    let goals: UILabel = {
        let label = UILabel()
        label.text = "G"
        return label
    }()
    
    let names: UILabel = {
        let label = UILabel()
        label.text = "Team name"
        return label
    }()
    
    let wins: UILabel = {
        let label = UILabel()
        label.text = "W"
        return label
    }()
    
    let draws: UILabel = {
        let label = UILabel()
        label.text = "D"
        return label
    }()
    
    let loses: UILabel = {
        let label = UILabel()
        label.text = "L"
        return label
    }()
    
    let points: UILabel = {
        let label = UILabel()
        label.text = "P"
        return label
    }()
    
    
    
    let url = "https://mocki.io/v1/5f652acf-e4a5-447f-a062-989dc1e9a116"
    
    
    private var identifier = "cellScore"
    private var headerIdentifier = "headerScore"
    
    private let tableView: UITableView = {
        let view = UITableView()
        return view
    }()
    
    var menu: SideMenuNavigationController?
//MARK: - viewDidLoad
    override func viewDidLoad() {
        title = "Alaman League"

        menu = SideMenuNavigationController(rootViewController: ListTableViewController())
        menu?.leftSide = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        // Menu button
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .done, target: self, action: #selector(goToMenu))
        navigationItem.leftBarButtonItem?.tintColor = .black
        menu?.presentDuration = 0.7
        tableView.register(ScoreTableCell.self, forCellReuseIdentifier: identifier)
        tableView.register(ScoreHeader.self, forHeaderFooterViewReuseIdentifier: headerIdentifier)
        tableView.reloadData()
        setConstraint()
        
        
    }
    
     //Method for Menu button
    @objc func goToMenu() {
        present(menu!, animated: true, completion: nil)
    }
    
    
    private func setConstraint() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        view.addSubview(viewOfTeams)
        viewOfTeams.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-350)
            make.width.equalToSuperview()
            make.bottom.equalTo(tableView)
        }
        viewOfTeams.addSubview(number)
        number.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(30)
            make.height.equalTo(30)
        }
        
        
        viewOfTeams.addSubview(names)
        names.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(number.snp_trailingMargin).offset(30)
            make.height.equalTo(30)
        }
        
        viewOfTeams.addSubview(matches)
        matches.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(names.snp_trailingMargin).offset(60)
            make.height.equalTo(30)
        }
        
        viewOfTeams.addSubview(wins)
        wins.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(names.snp_trailingMargin).offset(90)
            make.height.equalTo(30)
        }
        
        viewOfTeams.addSubview(draws)
        draws.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(wins.snp_trailingMargin).offset(25)
            make.height.equalTo(30)
        }
        
        viewOfTeams.addSubview(loses)
        loses.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(draws.snp_trailingMargin).offset(25)
            make.height.equalTo(30)
        }
        
        viewOfTeams.addSubview(goals)
        goals.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(loses.snp_trailingMargin).offset(25)
            make.height.equalTo(30)
        }
        
        viewOfTeams.addSubview(points)
        points.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(goals.snp_trailingMargin).offset(40)
            make.height.equalTo(30)
        }
    }
}

extension ScoreController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ScoreTableCell
        cell.configure(url: url,indexPath: indexPath)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    //MARK: - Header
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerIdentifier) as! ScoreHeader
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        180
    }
    
    
}
