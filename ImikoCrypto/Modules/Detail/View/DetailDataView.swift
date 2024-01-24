//
//  DetailDataView.swift
//  ImikoCrypto
//
//  Created by CT4TuEI3 on 24.01.2024.
//


import UIKit

final class DetailDataView: UIView {
    
    // MARK: - UI Elements
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.regular12
        label.textColor = .mainWhiteText.withAlphaComponent(0.5)
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.regular16
        label.textColor = .mainWhiteText
        return label
    }()
    
    
    // MARK: - Life cycle
    
    init(title: String, value: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        valueLabel.text = value
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Private methods
    
    private func setupUI() {
        stackView.addArrangedSubviews(titleLabel, valueLabel)
        addSubview(stackView)
        setupConstraints()
    }
}


// MARK: - Constraints

private
extension DetailDataView {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 12)
        ])
    }
}
