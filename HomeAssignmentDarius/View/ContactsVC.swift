//
//  ViewController.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 07.12.2023.
//

import UIKit

/// The main ViewController
class ContactsVC: UIViewController {
    let subtitleLabel = UILabel()
    let tableView = UITableView()
    
    let viewModel: ContactsViewModel
    
    init(viewModel: ContactsViewModel) {
        self.viewModel = viewModel
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if viewModel.hasError {
            let alert = UIAlertController(title: "Error", message: "An error has occured. Please try again later.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .cancel)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
    @objc func navigationButtonPressed() {
        let destinationVC = viewModel.createDestinationVC(using: nil)
        destinationVC.delegate = self
        show(destinationVC, sender: self)
    }
}

//MARK: - Setup view extension

extension ContactsVC {
    private func style() {
        // view controller
        self.title = "Contacte"
        view.backgroundColor = UIColor.backgroundColor
        self.navigationController?.navigationBar.tintColor = UIColor.white
        let addButton = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle.badge.plus"), style: .plain, target: self, action: #selector(navigationButtonPressed))
        addButton.tintColor = UIColor.labelColor
        self.navigationItem.rightBarButtonItem = addButton
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "", style: .plain, target: nil, action: nil)
        
        // subtitleLabel
        subtitleLabel.text = "CONTACTELE MELE"
        subtitleLabel.textColor = UIColor.labelColor
        subtitleLabel.font = UIFont.labelFont
        
        // tableView
        tableView.backgroundColor = UIColor.white
        tableView.register(ContactCell.self, forCellReuseIdentifier: ContactCell.identifier)
        tableView.rowHeight = 100
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.cellLayoutMarginsFollowReadableWidth = false
    }
    
    private func layout() {
        // add subviews
        view.addSubview(subtitleLabel)
        view.addSubview(tableView)
        
        // translatesAutoresizingMaskIntoConstraints
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // constraints
        // label
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19)
        ])
        // tableView
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 12),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
    }
}

//MARK: - UITableViewDelegate and UITableViewDataSource extensions

extension ContactsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(viewModel.contacts.count)
        return viewModel.contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactCell.identifier) as? ContactCell else {
            let cell = UITableViewCell()
            var content = cell.defaultContentConfiguration()
            content.text = "There is an error"
            cell.contentConfiguration = content
            return cell
        }
        
        cell.viewModel = ContactCellViewModel(contactModel: viewModel.contacts[indexPath.row])
        
        cell.preservesSuperviewLayoutMargins = false
        cell.layoutMargins = UIEdgeInsets.zero
        cell.separatorInset = UIEdgeInsets.zero

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destinationVC = viewModel.createDestinationVC(using: indexPath.row)
        destinationVC.delegate = self
        show(destinationVC, sender: self)
    }
}

extension ContactsVC: ContactDetailsDelegate {
    func update() {
        viewModel.updateContacts()
        tableView.reloadData()
    }
}

