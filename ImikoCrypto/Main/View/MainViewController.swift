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
    
    private var tableViewDataSource: [CryptoData] = []
    
    // MARK: - UI Elements
    
    private let backGroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "background"))
        return imageView
    }()
    
    private let customNavBar: MainNavBar = {
        let view = MainNavBar()
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
        presenter?.getData()
        setupUI()
    }
    
    
    // MARK: - Private Methods
    
    private func setupUI() {
        navigationController?.delegate = self
        view.addSubviews(backGroundImageView,
                         customNavBar,
                         tableView)
        backGroundImageView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        setupConstraints()
    }
    
    
    // MARK: - Actions
    
}


// MARK: - UINavigationControllerDelegate

extension MainViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              willShow viewController: UIViewController,
                              animated: Bool) {
            navigationController.setNavigationBarHidden(true, animated: true)
    }
}


// MARK: - UITableViewDelegate, UITableViewDataSource

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableViewDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellForIndexPath(indexPath) as MainTableViewCell
        let item = tableViewDataSource[indexPath.row]
        cell.configure(item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailBuilder.createDetailModule()
        navigationController?.pushViewController(vc, animated: true)
    }
}


// MARK: - MainViewControllerProtocol

extension MainViewController: MainViewControllerProtocol {
    func setDataSource(_ data: [CryptoData]) {
        tableViewDataSource = data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
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
