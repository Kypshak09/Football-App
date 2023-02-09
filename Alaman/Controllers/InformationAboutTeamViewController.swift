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
    let teamNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        title = nameOfTeam
        teamNameLabel.text = nameOfTeam
        configure()
    }
    
    func configure() {
        view.addSubview(teamNameLabel)
        teamNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.centerX.equalToSuperview()
        }
    }
}
