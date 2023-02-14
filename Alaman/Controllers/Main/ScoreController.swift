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
    
    var teamArray = [TeamsDescription]()
    
    
    let request = SquadRequest()
    
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
        tableView.bounces = false
        menu = SideMenuNavigationController(rootViewController: ListTableViewController())
        menu?.leftSide = true
        tableView.delegate = self
        tableView.dataSource = self
        // Menu button
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .done, target: self, action: #selector(goToMenu))
        navigationItem.leftBarButtonItem?.tintColor = .black
        menu?.presentDuration = 0.7
        tableView.register(ScoreTableCell.self, forCellReuseIdentifier: identifier)
        tableView.register(ScoreHeader.self, forHeaderFooterViewReuseIdentifier: headerIdentifier)
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refresh))
        navigationItem.rightBarButtonItem?.tintColor = .black
        tableView.separatorStyle = .none
        
        
        
        setConstraint()
        
        Requests.shared.getData { models in
            guard let models = models else {return}
            self.teamArray = models.table
            self.teamArray.sort { $0.points > $1.points }
            self.tableView.reloadData()
//            print(self.teamArray)
        }
        
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
            make.centerY.equalToSuperview().offset(-150)
            make.width.equalToSuperview()
        }
        viewOfTeams.addSubview(number)
        number.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.height.equalTo(30)
        }
        
        
        viewOfTeams.addSubview(names)
        names.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(65)
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
        teamArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ScoreTableCell
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor(red: 0.941, green: 0.955, blue: 0.97, alpha: 1)
        } else {
            cell.backgroundColor = .white
        }
        cell.numberInTable.text = String(indexPath.row + 1)
        let team = teamArray[indexPath.row]
        cell.configure(team: team)
        cell.selectionStyle = .none
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true, completion: nil)
        let ns = InformationAboutTeamViewController()
        ns.nameOfTeam = teamArray[indexPath.row].name
        ns.placeIntable = indexPath.row + 1
        present(ns, animated: true)
    }
    
    //MARK: - Header
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerIdentifier) as! ScoreHeader
        
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        200
    }
    
    
}
