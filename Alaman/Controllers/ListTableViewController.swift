//
//  ListTableViewController.swift
//  Alaman
//
//  Created by Amir Zhunussov on 23.01.2023.
//

import UIKit

class ListTableViewController: UITableViewController {

    let data = ["Table","About us", "Settings"]
    
    let identifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.tintColor = .black
        title = "Menu"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.bounces = false
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        switch indexPath.row {
        case 0: cell.imageView?.image = UIImage(systemName: "sportscourt")
        case 1: cell.imageView?.image = UIImage(systemName: "questionmark.circle")
        default: cell.imageView?.image = UIImage(systemName: "gear")
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let aboutUsController = AboutUsViewController()
        let settingsViewController = SettingsViewController()
        switch indexPath.row {
        case 0:
            dismiss(animated: true)
        case 1:
            present(aboutUsController, animated: true, completion: nil)
        default: 
            present(settingsViewController, animated: true, completion: nil)
        }
    }
}
