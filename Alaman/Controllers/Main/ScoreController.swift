//
//  ScoreController.swift
//  Alaman
//
//  Created by Amir Zhunussov on 22.01.2023.
//

import UIKit
import SnapKit

class ScoreController: UIViewController {
    
    
    lazy var menuButton = UIBarButtonItem(image: UIImage(systemName: "menucard"), style: .done, target: self, action: #selector(goToMenu))
    
    override func viewDidLoad() {
        title = "Alaman League"
        navigationItem.setLeftBarButton(menuButton, animated: true)
        menuButton.tintColor = .black
    }
    
    @objc func goToMenu() {
        print("working")
    }
    
}
