//
//  ContactCell.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 09.12.2023.
//

import UIKit
/// cell used to display contacts in table view
class ContactCell: UITableViewCell {
    
    static let identifier = "ContactCell"
    
    let profileImage = UIImageView()
    let contactNameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        styleCell()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImage.layer.cornerRadius = profileImage.bounds.width / 2
        profileImage.clipsToBounds = true
    }
    
    private func styleCell() {
        ///cell
        self.backgroundColor = UIColor.clear
        self.selectionStyle = .none
        let chevronImage = UIImage(systemName: "chevron.right")
        let chevronImageView = UIImageView(image: chevronImage)
        chevronImageView.tintColor = UIColor.componentsColor
        self.accessoryView = chevronImageView
        
        /// profileImage
        let image = UIImage(named: "profileImage")
        profileImage.image = image
        
        /// contactNameLAbel
        contactNameLabel.text = "Nume Frumos"
        contactNameLabel.textColor = UIColor.black
        contactNameLabel.font = UIFont.contactCellFont
    }
    
    private func layout() {
        /// add subviews
        contentView.addSubview(profileImage)
        contentView.addSubview(contactNameLabel)
        
        /// translatesAutoresizingMaskIntoConstraints
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        contactNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        /// constraints
        /// profileImage
        NSLayoutConstraint.activate([
            profileImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            profileImage.widthAnchor.constraint(equalToConstant: 50),
            profileImage.heightAnchor.constraint(equalToConstant: 50)
        ])
        /// contactNameLabel
        NSLayoutConstraint.activate([
            contactNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            contactNameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 18)
        ])
    }
}
