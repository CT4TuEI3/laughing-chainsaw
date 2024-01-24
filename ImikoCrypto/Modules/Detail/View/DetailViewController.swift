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
    
    private var item: CryptoData?
    
    
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
    
    private let amountsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .mainWhiteText
        label.font = Typography.regular24
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let changePriceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .greenText
        label.font = Typography.regular14
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let detailDataStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getItem()
        setupUI()
    }
    
    
    // MARK: - Private Methods
    
    private func setupUI() {
        mainStackView.addArrangedSubviews([backButton, titleLabel])
        amountsStackView.addArrangedSubviews([priceLabel, changePriceLabel])
        detailDataStackView.addArrangedSubviews([DetailDataView(title: LocalizedText.Detail.marketCap,
                                                                value: item?.marketCapUsd.bigCurrencyFormatter() ?? ""),
                                                 UIView(),
                                                 DetailDataView(title: LocalizedText.Detail.supply,
                                                                value: item?.maxSupply?.bigCurrencyFormatter(isSupply: true) ?? "nul"),
                                                 UIView(),
                                                 DetailDataView(title: LocalizedText.Detail.Volume24Hr,
                                                                value: item?.volumeUsd24Hr.bigCurrencyFormatter() ?? "")])
        view.addSubviews([backGroundImageView,
                          mainStackView,
                          amountsStackView,
                          detailDataStackView])
        backGroundImageView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        setupConstraints()
    }
    
    private func updateUI() {
        guard let item else { return }
        DispatchQueue.main.async {
            self.titleLabel.text = item.name
            self.priceLabel.text = item.priceUsd.currencyFormatting()
            self.changePriceLabel.text = item.changePercent24Hr.percentFormatting()
            self.changePriceLabel.textColor = item.changePercent24Hr.first == "-" ? .redText : .greenText
        }
    }
    
    
    // MARK: - Actions
    
    @objc
    private func backPressed() {
        navigationController?.popViewController(animated: true)
    }
}




// MARK: - DetailViewControllerProtocol

extension DetailViewController: DetailViewControllerProtocol {
    func showItem(_ item: CryptoData) {
        self.item = item
        updateUI()
    }
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
            
            amountsStackView.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 12),
            amountsStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            amountsStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            detailDataStackView.heightAnchor.constraint(equalToConstant: 60),
            detailDataStackView.topAnchor.constraint(equalTo: amountsStackView.bottomAnchor, constant: 12),
            detailDataStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            detailDataStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        ])
    }
}
