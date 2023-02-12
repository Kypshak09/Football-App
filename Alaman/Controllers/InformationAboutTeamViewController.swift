//
//  InformationAboutTeamViewController.swift
//  Alaman
//
//  Created by Amir Zhunussov on 25.01.2023.
//

import UIKit
import SnapKit

class InformationAboutTeamViewController: UIViewController {

    var nameOfTeam: String?
    var placeIntable : Int?
    let teamNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    let placeInTabelLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .bold)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        title = nameOfTeam
        teamNameLabel.text = nameOfTeam
        placeInTabelLabel.text = String("Place in table: \(placeIntable!)")
        configure()
    }
    
    func configure() {
        view.addSubview(teamNameLabel)
        teamNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(placeInTabelLabel)
        placeInTabelLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
