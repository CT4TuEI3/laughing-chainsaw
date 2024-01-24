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
    
    private let item: CryptoData?
    
    
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
    
    private let amountsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$ 22 678.48"
        label.textColor = .mainWhiteText
        label.font = Typography.regular24
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let changePriceLabel: UILabel = {
        let label = UILabel()
        label.text = "+ 100.48 (4.32%)"
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
    
    init(item: CryptoData) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    // MARK: - Private Methods
    
    private func setupUI() {
        mainStackView.addArrangedSubviews(backButton, titleLabel)
        amountsStackView.addArrangedSubviews(priceLabel, changePriceLabel)
        detailDataStackView.addArrangedSubviews(DetailDataView(title: "Market Cap",
                                                               value: item?.marketCapUsd.bigCurrencyFormatter() ?? ""),
                                                UIView(),
                                                DetailDataView(title: "Supply",
                                                               value: item?.maxSupply?.bigCurrencyFormatter(isSupply: true) ?? "nul"),
                                                UIView(),
                                                DetailDataView(title: "Volume 24Hr",
                                                               value: item?.volumeUsd24Hr.bigCurrencyFormatter() ?? ""))
        view.addSubviews(backGroundImageView,
                         mainStackView,
                         amountsStackView,
                         detailDataStackView)
        backGroundImageView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        updateUI()
        setupConstraints()
    }
    
    private func updateUI() {
        guard let item = item else { return }
        titleLabel.text = item.name
        priceLabel.text = item.priceUsd.currencyFormatting()
        changePriceLabel.text = item.changePercent24Hr.percentFormatting()
        changePriceLabel.textColor = item.changePercent24Hr.first == "-" ? .redText : .greenText
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
