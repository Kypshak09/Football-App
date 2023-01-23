//
//  ScoreHeader.swift
//  Alaman
//
//  Created by Amir Zhunussov on 23.01.2023.
//

import UIKit
import SnapKit

class ScoreHeader: UITableViewHeaderFooterView {
    
    let view: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.backgroundColor = .systemGray
        return view
    }()
    
    let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Alaman")
        return image
    }()
    
    let labelAlaman: UILabel = {
        let label = UILabel()
        label.text = "ALAMAN LIGA"
        label.font = UIFont(name: "Impact", size: 45)
        return label
    }()
    
    let seasonLabel: UILabel = {
        let label = UILabel()
        label.text = "2022-2023"
        label.font = UIFont(name: "Impact", size: 45)
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setHeaderConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setHeaderConstraint() {
        self.addSubview(image)
        image.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.height.equalTo(150)
            make.top.equalToSuperview().offset(-20)
        }
        
        self.addSubview(view)
        view.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(400)
            make.top.equalToSuperview().offset(50)
        }
        
        view.addSubview(labelAlaman)
        labelAlaman.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
        view.addSubview(seasonLabel)
        seasonLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
}
