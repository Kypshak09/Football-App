//
//  GoleadorsCell.swift
//  Alaman
//
//  Created by Amir Zhunussov on 13.02.2023.
//

import UIKit
import SnapKit

class GoleadorsCell: UITableViewCell {

    
    let name: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let goal: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let match: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let team: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let view: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        view.layer.cornerRadius = 15
        return view
    }()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        configureConstraint()
        
    }
    
    private func configureConstraint() {
        self.addSubview(view)
        view.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().offset(-20)
        }
        view.addSubview(name)
        name.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
        view.addSubview(team)
        team.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(100)
        }
        view.addSubview(match)
        match.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-40)
        }
        view.addSubview(goal)
        goal.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-10)
        }
    }

}
