//
//  TeamsCell.swift
//  Alaman
//
//  Created by Amir Zhunussov on 11.02.2023.
//

import UIKit
import SnapKit

class TeamsCell: UITableViewCell {
    
    let name: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir-Light", size: 15.0)
        return label
    }()
    
    let image: UIImageView = {
        let image = UIImageView()
        let nameOfImage: String = ""
        image.image = UIImage(named: nameOfImage)
        return image
    }()
    
    let viewOfTeams: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        configure()
        
    }
    
   
    
    func configure() {
        self.addSubview(viewOfTeams)
        viewOfTeams.snp.makeConstraints { make in
        make.centerY.centerX.equalToSuperview()
        make.width.equalToSuperview().offset(-16)
        make.height.equalTo(68)
        }
        viewOfTeams.addSubview(name)
        name.snp.makeConstraints { make in
        make.centerX.centerY.equalToSuperview()
        }
        
        viewOfTeams.addSubview(image)
        image.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(30)
        }
        }
    
}
