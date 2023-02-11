//
//  SquadCell.swift
//  Alaman
//
//  Created by Amir Zhunussov on 11.02.2023.
//

import UIKit
import SnapKit

class SquadCell: UITableViewCell {

    let cellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        return view
    }()
    
    let label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        configureConstraint()
    }
    
    func configure(player: Player) {
        self.label.text = player.name
    }
    
    private func configureConstraint() {
        
        self.addSubview(cellView)
        cellView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        cellView.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
    }

}
