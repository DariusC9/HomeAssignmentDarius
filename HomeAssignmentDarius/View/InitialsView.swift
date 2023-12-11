//
//  InitialsView.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 10.12.2023.
//

import UIKit

class InitialsView: UIView {
    
    let initialsLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        style()
        layout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = self.bounds.width / 2
        self.layer.masksToBounds = true
    }
    
    private func style() {
        // view
        self.backgroundColor = UIColor.labelColor
        // initialsLabel
        initialsLabel.text = "DC"
        initialsLabel.textColor = UIColor.white
        initialsLabel.textAlignment = .center
        initialsLabel.font = UIFont.systemFont(ofSize: 20)
    }
    
    private func layout() {
        // add subviews
        self.addSubview(initialsLabel)
        
        // translatesAutoresizingMaskIntoConstraints
        initialsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // constraints
        // initialsLabel
        NSLayoutConstraint.activate([
            initialsLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            initialsLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
