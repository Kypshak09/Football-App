//
//  ViewController.swift
//  Alaman
//
//  Created by Amir Zhunussov on 22.01.2023.
//

import UIKit

class tabBarViewController: UITabBarController{

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.tabBar.tintColor = .black
        
        
        
        let team = createTabBar(vc: TeamsController(), itemImage: "person.3.fill", itemName: "Teams")
        let score = createTabBar(vc: ScoreController(), itemImage: "sportscourt", itemName: "League")
        let players = createTabBar(vc: PlayersController(), itemImage: "figure.walk", itemName: "Players")
        
        viewControllers = [score,team,players]
        
    }
    
  


    func createTabBar(vc: UIViewController, itemImage: String, itemName: String) -> UIViewController {
        let controller = UINavigationController(rootViewController: vc)
        controller.tabBarItem.title = itemName
        controller.tabBarItem.image = UIImage(systemName: itemImage)
        controller.navigationItem.title = itemName
        controller.navigationBar.scrollEdgeAppearance = controller.navigationBar.standardAppearance
        return controller
    }
    
   
    
}

