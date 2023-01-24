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
    
    var requests = Requests()
    
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    var name: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    var matches: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    var image: UIImageView = {
        let image = UIImageView()
        let nameOfImage = ""
        image.image = UIImage(named: nameOfImage)
        return image
    }()
    var wins: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    var lose: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    var draw: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    var goals: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    var points: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    var numberInTable: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setConstraint()
        image.layer.cornerRadius = image.frame.height / 2
        
    }
    
    func configure(url: String,indexPath: IndexPath) {
        requests.getData(url) { apiData in
            self.wins.text = apiData.table[indexPath.row].win
            self.goals.text = apiData.table[indexPath.row].goal
            self.draw.text = apiData.table[indexPath.row].draw
            self.lose.text = apiData.table[indexPath.row].lost
            self.points.text = apiData.table[indexPath.row].points
            self.name.text = apiData.table[indexPath.row].name
            self.matches.text = apiData.table[indexPath.row].matches
        }
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
        
         cellView.addSubview(name)
         name.snp.makeConstraints { make in
             make.centerY.equalToSuperview()
             make.leading.equalToSuperview().offset(70)
             make.width.equalTo(80)
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
         
         cellView.addSubview(matches)
         matches.snp.makeConstraints { make in
             make.centerY.equalToSuperview()
             make.leading.equalTo(name.snp_trailingMargin).offset(65)
         }
         
         cellView.addSubview(wins)
         wins.snp.makeConstraints { make in
             make.centerY.equalToSuperview()
             make.leading.equalTo(matches.snp_trailingMargin).offset(30)
         }
         
         cellView.addSubview(draw)
         draw.snp.makeConstraints { make in
             make.centerY.equalToSuperview()
             make.leading.equalTo(wins.snp_trailingMargin).offset(30)
         }
         
         
         cellView.addSubview(lose)
         lose.snp.makeConstraints { make in
             make.centerY.equalToSuperview()
             make.leading.equalTo(draw.snp_trailingMargin).offset(25)
         }
         
         
         cellView.addSubview(goals)
         goals.snp.makeConstraints { make in
             make.centerY.equalToSuperview()
             make.leading.equalTo(lose.snp_trailingMargin).offset(27)
         }
         
         cellView.addSubview(points)
         points.snp.makeConstraints { make in
             make.centerY.equalToSuperview()
             make.leading.equalTo(goals.snp_trailingMargin).offset(27)
         }
    }
    
}
