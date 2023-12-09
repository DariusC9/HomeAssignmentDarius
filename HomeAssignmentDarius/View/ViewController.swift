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
}

//MARK: - Setup view extension

extension ViewController {
    
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
        tableView.register(ContactCell.self, forCellReuseIdentifier: ContactCell.identifier)
        tableView.rowHeight = 100
        tableView.delegate = self
        tableView.dataSource = self
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

//MARK: - UITableViewDelegate and UITableViewDataSource extensions

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactCell.identifier) as? ContactCell else {
            let cell = UITableViewCell()
            var content = cell.defaultContentConfiguration()
            content.text = "There is an error"
            cell.contentConfiguration = content
            return cell
        }

        return cell
    }
    
}

