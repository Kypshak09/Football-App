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
    
    private var teamArray = ["Team","Maiqudyk", "Kokshetau", "Aqsay"]
    private var numberInTableArray = ["#","1)","2)","3)"]
    private var imageArray = ["","MC", "MU", "Chelsea"]
    private var winArray = ["W","3", "2", "1"]
    private var drawArray = ["D","0", "0", "1"]
    private var loseArray = ["L","1", "2", "2"]
    private var pointsArray = ["P","9", "6", "4"]
    private var goalsArray = ["G","11", "6", "3"]
    
    
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
    }
}

extension ScoreController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ScoreTableCell
        switch indexPath.row {
        case 0: cell.label.text = teamArray[indexPath.row]
            cell.numberInTable.text = numberInTableArray[indexPath.row]
            cell.image.image = UIImage(named: imageArray[indexPath.row])
            cell.wins.text = winArray[indexPath.row]
            cell.draw.text = drawArray[indexPath.row]
            cell.lose.text = loseArray[indexPath.row]
            cell.goals.text = goalsArray[indexPath.row]
            cell.points.text = pointsArray[indexPath.row]
        case 1: cell.label.text = teamArray[indexPath.row]
            cell.numberInTable.text = numberInTableArray[indexPath.row]
            cell.image.image = UIImage(named: imageArray[indexPath.row])
                                                  cell.wins.text = winArray[indexPath.row]
                                                  cell.draw.text = drawArray[indexPath.row]
                                                  cell.lose.text = loseArray[indexPath.row]
                                                  cell.goals.text = goalsArray[indexPath.row]
                                                  cell.points.text = pointsArray[indexPath.row]
        default: cell.label.text = teamArray[indexPath.row]
            cell.numberInTable.text = numberInTableArray[indexPath.row]
            cell.image.image = UIImage(named: imageArray[indexPath.row])
                                                                                        cell.wins.text = winArray[indexPath.row]
                                                                                        cell.draw.text = drawArray[indexPath.row]
                                                                                        cell.lose.text = loseArray[indexPath.row]
                                                                                        cell.goals.text = goalsArray[indexPath.row]
                                                                                        cell.points.text = pointsArray[indexPath.row]
        }
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
        140
    }
    
    
}
