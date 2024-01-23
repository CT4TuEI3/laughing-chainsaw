//
//  CustomNavBarView.swift
//  ImikoCrypto
//
//  Created by CT4TuEI3 on 23.01.2024.
//


import UIKit

final class MainNavBar: UIView {
    
    // MARK: UI Elements
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.expandedSemibold24
        label.textColor = .mainWhiteText
        label.text = "Trending Coins"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        let borderColor = UIColor(named: "borderColor")?.cgColor
        button.setImage(UIImage(named: "lupa"), for: .normal)
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = borderColor
        button.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("cancel", for: .normal)
        button.setTitleColor(.mainWhiteText.withAlphaComponent(0.5), for: .normal)
        button.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    
    // MARK: - Life cycle
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Private methods
    
    private func setupUI() {
        mainStackView.addArrangedSubviews(titleLabel, searchButton)
        addSubviews(mainStackView)
        setupConstraints()
    }
    
    
    // MARK: - Actions
    
    @objc
    private func searchButtonPressed() {
        mainStackView.removeArrangedSubview(titleLabel)
        mainStackView.removeArrangedSubview(searchButton)
        titleLabel.isHidden = true
        searchButton.isHidden = true
        cancelButton.isHidden = false
        mainStackView.addArrangedSubviews(searchBar, cancelButton)
    }
    
    @objc
    private func cancelButtonPressed() {
        mainStackView.removeArrangedSubview(searchBar)
        mainStackView.removeArrangedSubview(cancelButton)
        titleLabel.isHidden = false
        searchButton.isHidden = false
        cancelButton.isHidden = true
        mainStackView.addArrangedSubviews(titleLabel, searchButton)
    }
}


// MARK: - Constraints

private
extension MainNavBar {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            mainStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            mainStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            searchButton.widthAnchor.constraint(equalToConstant: 40),
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            
            searchBar.heightAnchor.constraint(equalToConstant: 40),
            
            cancelButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
