//
//  AboutUsViewController.swift
//  Alaman
//
//  Created by Amir Zhunussov on 23.01.2023.
//

import UIKit
import SnapKit

class AboutUsViewController: UIViewController {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "ALAMAN LEAGUE"
        label.font = UIFont(name: "Arial Bold", size: 40)
        return label
    }()
    
    let aboutProjectLabel: UILabel = {
        let label = UILabel()
        label.text = "The project was made for myself, as I am a soccer fan and we have our own amateur leagues in the city, but they have no applications or website where you could see all the results, all the goals, the team composition. It's all published on Instagram. So I created a skeleton of the app as I would see it."
        label.numberOfLines = 8
        label.tintColor = UIColor(displayP3Red: 1.89, green: 2.05, blue: 2.14, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    let instaImage: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "insta"), for: .normal)
        button.imageView?.tintColor = UIColor(displayP3Red: 1.47, green: 1.91, blue: 2.07, alpha: 1)
        button.tintColor = UIColor(displayP3Red: 1.47, green: 1.91, blue: 2.07, alpha: 1)
        return button
    }()
    
    let youtubeImage: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "youtube"), for: .normal)
        button.imageView?.tintColor = UIColor(displayP3Red: 1.47, green: 1.91, blue: 2.07, alpha: 1)
        button.tintColor = UIColor(displayP3Red: 1.47, green: 1.91, blue: 2.07, alpha: 1)
        return button
    }()
    
    let telegramImage: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "telegram"), for: .normal)
        button.imageView?.tintColor = UIColor(displayP3Red: 1.47, green: 1.91, blue: 2.07, alpha: 1)
        button.tintColor = UIColor(displayP3Red: 1.47, green: 1.91, blue: 2.07, alpha: 1)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "About us"
        view.backgroundColor = UIColor(displayP3Red: 0.96, green: 1.5, blue: 1.8, alpha: 1)
        configureConstraint()
        telegramImage.addTarget(self, action: #selector(goToTg()), for: .touchUpInside)
        instaImage.addTarget(self, action: #selector(goToInsta()), for: .touchUpInside)
        youtubeImage.addTarget(self, action: #selector(goToYT()), for: .touchUpInside)
    }
    
    @objc func goToTg() {
                
    }
            
    @objc func goToInsta() {
                
    }
            
    @objc func goToYT() {
                
    }

    
    private func configureConstraint() {
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.centerX.equalToSuperview()
        }
        view.addSubview(aboutProjectLabel)
        aboutProjectLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp_bottomMargin).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        view.addSubview(youtubeImage)
        youtubeImage.snp.makeConstraints { make in
            make.top.equalTo(aboutProjectLabel.snp_bottomMargin).offset(95)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(70)
        }
        
        
        view.addSubview(instaImage)
        instaImage.snp.makeConstraints { make in
            make.top.equalTo(aboutProjectLabel.snp_bottomMargin).offset(100)
            make.trailing.equalTo(youtubeImage.snp_leadingMargin).offset(-40)
            make.width.height.equalTo(60)
        }
        
        view.addSubview(telegramImage)
        telegramImage.snp.makeConstraints { make in
            make.top.equalTo(aboutProjectLabel.snp_bottomMargin).offset(100)
            make.leading.equalTo(youtubeImage.snp_trailingMargin).offset(40)
            make.width.height.equalTo(60)
        }
    }
}


