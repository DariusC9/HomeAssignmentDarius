//
//  ContactDetailsVC.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 09.12.2023.
//

import UIKit

protocol ContactDetailsVMProtocol {
    
    var contact: ContactModel { get }
    
    func createTitle() -> String
}

/// view controller used to display the details of a contact or to add a new contact
class ContactDetailsVC: UIViewController {
    
    let detailsStackView = UIStackView()
    let firstNameView: ContactDetailsView
    let secondNameView: ContactDetailsView
    let telefonView: ContactDetailsView
    let emailView: ContactDetailsView
    let button = UIButton()
    
    let viewModel: ContactDetailsVMProtocol
    
    init(viewModel: ContactDetailsVMProtocol) {
        self.viewModel = viewModel
        firstNameView = ContactDetailsView(title: "NUME", textFieldText: viewModel.contact.name)
        secondNameView = ContactDetailsView(title: "PRENUME", textFieldText: viewModel.contact.name)
        telefonView = ContactDetailsView(title: "TELEFON", textFieldText: viewModel.contact.name)
        emailView = ContactDetailsView(title: "EMAIL", textFieldText: viewModel.contact.name)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        style()
        layout()
    }
    
    @objc func buttonPressed(sender: UIButton!) {
      print("Button pressed")
    }
}

//MARK: - Setup view extension

extension ContactDetailsVC {
    
    private func style() {
        /// view controller
        self.title = viewModel.createTitle()
        view.backgroundColor = UIColor.backgroundColor
        
        /// collectionView
        detailsStackView.backgroundColor = UIColor.white
        detailsStackView.distribution = .fillEqually
        detailsStackView.axis = .vertical
        
        /// button
        button.setTitle("Salveaza", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 68/255, green: 200/255, blue: 77/255, alpha: 1.0)
        button.layer.cornerRadius = 15
        button.layer.shadowColor = UIColor.lightGray.cgColor
        button.layer.shadowOpacity = 0.6
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowRadius = 4
    }
    
    private func layout() {
        /// add subviews
        view.addSubview(detailsStackView)
        detailsStackView.addArrangedSubview(firstNameView)
        detailsStackView.addArrangedSubview(secondNameView)
        detailsStackView.addArrangedSubview(telefonView)
        detailsStackView.addArrangedSubview(emailView)
        view.addSubview(button)
        
        /// translatesAutoresizingMaskIntoConstraints
        detailsStackView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        /// constraints
        /// detailsStackView
        NSLayoutConstraint.activate([
            detailsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        /// stack views
        NSLayoutConstraint.activate([
            firstNameView.heightAnchor.constraint(equalToConstant: 110),
            secondNameView.heightAnchor.constraint(equalToConstant: 110),
            telefonView.heightAnchor.constraint(equalToConstant: 110),
            emailView.heightAnchor.constraint(equalToConstant: 110)
        ])
        /// button
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
