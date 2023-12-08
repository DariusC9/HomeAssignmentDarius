//
//  ViewController.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 07.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let subtitleLabel = UILabel()

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
    }
    
    private func layout() {
        /// add subviews
        view.addSubview(subtitleLabel)
        
        /// translatesAutoresizingMaskIntoConstraints
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        /// constraints
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19)
        ])
    }
}

