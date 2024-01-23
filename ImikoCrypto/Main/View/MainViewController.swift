// 
//  MainViewController.swift
//  ImikoCrypto
//
//  Created by CT4TuEI3 on 23.01.2024.
//


import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - Dependency
    
    var presenter: MainPresenterProtocol?
    
    
    // MARK: - Private properties
    
    
    // MARK: - UI Elements
    
    private let backGroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "background"))
        return imageView
    }()
    
    private let customNavBar: CustomNavBarView = {
        let view = CustomNavBarView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(MainTableViewCell.self)
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    // MARK: - Private Methods
    
    private func setupUI() {
        view.addSubviews(backGroundImageView,
                         customNavBar,
                         tableView)
        backGroundImageView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        setupConstraints()
    }
    
    
    // MARK: - Actions
    
}


// MARK: - UITableViewDelegate, UITableViewDataSource

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellForIndexPath(indexPath) as MainTableViewCell
        return cell
    }
}


// MARK: - MainViewControllerProtocol

extension MainViewController: MainViewControllerProtocol {
    
}


// MARK: - Constraints

private
extension MainViewController {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            customNavBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            customNavBar.leftAnchor.constraint(equalTo: view.leftAnchor),
            customNavBar.rightAnchor.constraint(equalTo: view.rightAnchor),

            tableView.topAnchor.constraint(equalTo: customNavBar.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
