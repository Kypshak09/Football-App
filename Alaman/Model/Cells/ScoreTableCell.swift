//
//  ScoreTableCell.swift
//  Alaman
//
//  Created by Amir Zhunussov on 22.01.2023.
//

import Foundation
import UIKit
import SnapKit

class ScoreTableCell: UITableViewCell {
    
    
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let image: UIImageView = {
        let image = UIImageView()
        let nameOfImage = ""
        image.image = UIImage(named: nameOfImage)
        return image
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()

    let wins: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    let lose: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    let draw: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    let goals: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    let points: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    let numberInTable: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setConstraint()
        image.layer.cornerRadius = image.frame.height / 2
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
     func setConstraint() {
        
        self.addSubview(cellView)
        cellView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        cellView.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(70)
        }
         
         cellView.addSubview(image)
         image.snp.makeConstraints { make in
             make.leading.equalToSuperview().offset(30)
             make.centerY.equalToSuperview()
             make.width.height.equalTo(30)
         }
        
        cellView.addSubview(numberInTable)
        numberInTable.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
         
         cellView.addSubview(wins)
         wins.snp.makeConstraints { make in
             make.centerY.equalToSuperview()
             make.trailing.equalToSuperview().offset(-90)
         }
         
         cellView.addSubview(lose)
         lose.snp.makeConstraints { make in
             make.centerY.equalToSuperview()
             make.trailing.equalToSuperview().offset(-50)
         }
         
         cellView.addSubview(draw)
         draw.snp.makeConstraints { make in
             make.centerY.equalToSuperview()
             make.trailing.equalToSuperview().offset(-70)
         }
         
         cellView.addSubview(goals)
         goals.snp.makeConstraints { make in
             make.centerY.equalToSuperview()
             make.trailing.equalToSuperview().offset(-30)
         }
         
         cellView.addSubview(points)
         points.snp.makeConstraints { make in
             make.centerY.equalToSuperview()
             make.trailing.equalToSuperview().offset(-10)
         }
    }
    
}
