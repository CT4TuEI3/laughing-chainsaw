//
//  MainTableViewCell.swift
//  ImikoCrypto
//
//  Created by CT4TuEI3 on 23.01.2024.
//


import UIKit

final class MainTableViewCell: UITableViewCell {
    
    // MARK: - UI Elements
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let dataStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let titlesLabelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let amountLabelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let iconImageView: UIImageView = {
        let icon = UIImageView(image: UIImage(named: "btc"))
        icon.contentMode = .scaleAspectFit
        icon.tintColor = .white
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    private let fullTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Bitcoin"
        label.font = Typography.regular16
        label.textColor = .mainWhiteText
        return label
    }()
    
    private let shortTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "BTC"
        label.font = Typography.regular14
        label.textColor = .mainWhiteText.withAlphaComponent(0.5)
        return label
    }()
    
    private let priceAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "$ 22 678.48"
        label.font = Typography.regular16
        label.textColor = .mainWhiteText
        return label
    }()
    
    private let changePriceLabel: UILabel = {
        let label = UILabel()
        label.text = "+ 4.32%"
        label.font = Typography.regular14
        label.textColor = .greenText
        return label
    }()
    
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Configure
    
    func configure(_ item: CryptoData) {
        fullTitleLabel.text = item.name
        shortTitleLabel.text = item.symbol
        priceAmountLabel.text = item.priceUsd
        changePriceLabel.text = item.changePercent24Hr
    }
    
    
    // MARK: - Private methods
    
    private func setupUI() {
        backgroundColor = .clear
        selectionStyle = .none
        titlesLabelsStackView.addArrangedSubviews(fullTitleLabel, shortTitleLabel)
        amountLabelsStackView.addArrangedSubviews(priceAmountLabel, changePriceLabel)
        dataStackView.addArrangedSubviews(titlesLabelsStackView, amountLabelsStackView)
        mainStackView.addArrangedSubviews(iconImageView, dataStackView)
        addSubviews(mainStackView)
        setupConstraints()
    }
}


// MARK: - Constraints

private
extension MainTableViewCell {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            mainStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            mainStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            iconImageView.widthAnchor.constraint(equalToConstant: 48),
            iconImageView.topAnchor.constraint(equalTo: mainStackView.topAnchor),
            iconImageView.leftAnchor.constraint(equalTo: mainStackView.leftAnchor),
            iconImageView.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor),
            
            dataStackView.rightAnchor.constraint(equalTo: mainStackView.rightAnchor),
            
            titlesLabelsStackView.topAnchor.constraint(equalTo: dataStackView.topAnchor),
            titlesLabelsStackView.leftAnchor.constraint(equalTo: dataStackView.leftAnchor),
            titlesLabelsStackView.bottomAnchor.constraint(equalTo: dataStackView.bottomAnchor),
            
            amountLabelsStackView.topAnchor.constraint(equalTo: dataStackView.topAnchor),
            amountLabelsStackView.rightAnchor.constraint(equalTo: dataStackView.rightAnchor),
            amountLabelsStackView.bottomAnchor.constraint(equalTo: dataStackView.bottomAnchor),
            
            fullTitleLabel.topAnchor.constraint(equalTo: titlesLabelsStackView.topAnchor),
            fullTitleLabel.leftAnchor.constraint(equalTo: titlesLabelsStackView.leftAnchor),
            
            shortTitleLabel.leftAnchor.constraint(equalTo: titlesLabelsStackView.leftAnchor),
            shortTitleLabel.bottomAnchor.constraint(equalTo: titlesLabelsStackView.bottomAnchor),
            
            priceAmountLabel.topAnchor.constraint(equalTo: amountLabelsStackView.topAnchor),
            priceAmountLabel.rightAnchor.constraint(equalTo: amountLabelsStackView.rightAnchor),
            
            changePriceLabel.rightAnchor.constraint(equalTo: amountLabelsStackView.rightAnchor),
            changePriceLabel.bottomAnchor.constraint(equalTo: amountLabelsStackView.bottomAnchor)
        ])
    }
}

