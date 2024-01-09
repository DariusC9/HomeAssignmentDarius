//
//  ContactDetailsView.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 09.12.2023.
//

import UIKit

/// View used in ContactDetailsVC
class ContactDetailsView: UIView {
    
    let backgroundView = UIView()
    let titleLabel = UILabel()
    let textField = UITextField()
    let line = UIView()

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
    
    convenience init(title: String, textFieldText: String, frame: CGRect = .zero) {
        self.init(frame: frame)
        titleLabel.text = title
        textField.text = textFieldText
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundView.layer.cornerRadius = 15
        backgroundView.layer.masksToBounds = true
    }

    private func style() {
        // view
        self.backgroundColor = UIColor.backgroundColor
        
        // backgroundView
        backgroundView.backgroundColor = UIColor.white
        
        // titleLabel
        titleLabel.text = "NUME"
        titleLabel.font = UIFont.labelFont
        titleLabel.textColor = UIColor.labelColor
        
        // textField
        textField.borderStyle = UITextField.BorderStyle.none
        textField.text = "Nume Frumos"
        textField.backgroundColor = UIColor.white
        textField.textColor = UIColor.black
        
        // line
        line.backgroundColor = UIColor.backgroundColor
    }
    
    private func layout() {
        // add subviews
        self.addSubview(backgroundView)
        self.addSubview(titleLabel)
        self.addSubview(textField)
        self.addSubview(line)
        
        // translatesAutoresizingMaskIntoConstraints
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        
        // constraints
        // backgroundView
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ])
        // titleLabel
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 16),
        ])
        // textField
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 32),
            textField.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,constant: -16)
        ])
        // line
        NSLayoutConstraint.activate([
            line.topAnchor.constraint(equalTo: textField.bottomAnchor),
            line.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 16),
            line.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -16),
            line.heightAnchor.constraint(equalToConstant: 2)
        ])
    }
}
