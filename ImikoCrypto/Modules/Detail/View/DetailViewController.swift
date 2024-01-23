//
//  DetailViewController.swift
//  ImikoCrypto
//
//  Created by CT4TuEI3 on 23.01.2024.
//


import UIKit

final class DetailViewController: UIViewController {
    
    // MARK: - Dependency
    
    var presenter: DetailPresenterProtocol?
    
    
    // MARK: - Private properties
    
    
    // MARK: - UI Elements
    
    private let backGroundImageView = UIImageView(image: UIImage(named: "background"))
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.expandedSemibold24
        label.textColor = .mainWhiteText
        label.text = "Bitcoin"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        let borderColor = UIColor(named: "borderColor")?.cgColor
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = borderColor
        button.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    // MARK: - Private Methods
    
    private func setupUI() {
        mainStackView.addArrangedSubviews(backButton, titleLabel)
        view.addSubviews(backGroundImageView, mainStackView)
        backGroundImageView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        setupConstraints()
    }
    
    
    // MARK: - Actions
    
    @objc
    private func backPressed() {
        navigationController?.popViewController(animated: true)
    }
}




// MARK: - DetailViewControllerProtocol

extension DetailViewController: DetailViewControllerProtocol {
    
}


// MARK: - Constraints

private
extension DetailViewController {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
