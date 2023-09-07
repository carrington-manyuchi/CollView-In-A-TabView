//
//  ViewController.swift
//  CollView-In-A-TabView
//
//  Created by DA MAC M1 157 on 2023/09/07.
//

import UIKit

class ViewController: UIViewController {
    
    var models = [Model]()
    
        
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        models.append(Model(text: "First", imageName: "1"))
        
        models.append(Model(text: "Second", imageName: "2"))
        
        models.append(Model(text: "Three", imageName: "3"))

        setupUI()
    }

    func setupUI() {
        view.backgroundColor = .systemPink
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        setupConstraints()
    }
    
    func setupConstraints() {
        let tableViewConstraints = [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(tableViewConstraints)
    }

}

//MARK: - TableView delegates and datasource

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as? CollectionTableViewCell else {
            print("Could not dequeue collection Table View cell")
            return UITableViewCell()
        }
        
        cell.configure(with: models)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(250.0)
    }
}
