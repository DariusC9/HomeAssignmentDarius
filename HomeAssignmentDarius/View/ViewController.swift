//
//  ViewController.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 07.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let subtitleLabel = UILabel()
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
    private func style() {
        /// view controller
        self.title = "Contacte"
        view.backgroundColor = UIColor.backgroundColor
        
        /// subtitleLabel
        subtitleLabel.text = "CONTACTELE MELE"
        subtitleLabel.textColor = UIColor.labelColor
        subtitleLabel.font = UIFont.labelFont
        /// tableView
        tableView.backgroundColor = UIColor.white
    }
    
    private func layout() {
        /// add subviews
        view.addSubview(subtitleLabel)
        view.addSubview(tableView)
        
        /// translatesAutoresizingMaskIntoConstraints
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        /// constraints
        /// label
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19)
        ])
        /// tableView
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 12),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
    }
}

