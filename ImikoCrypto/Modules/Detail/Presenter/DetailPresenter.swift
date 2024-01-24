// 
//  DetailPresenter.swift
//  ImikoCrypto
//
//  Created by CT4TuEI3 on 23.01.2024.
//


import Foundation

protocol DetailViewControllerProtocol: AnyObject {
    func showItem(_ item: CryptoData)
}

protocol DetailPresenterProtocol {
    func getItem()
}

final class DetailPresenter {
    
    // MARK: - Private properties
    
    private weak var view: DetailViewControllerProtocol?
    private let item: CryptoData
    
    // MARK: - Lifecycle
    
    init(view: DetailViewControllerProtocol, item: CryptoData) {
        self.view = view
        self.item = item
    }
}

// MARK: - DetailPresenterProtocol

extension DetailPresenter: DetailPresenterProtocol {
    func getItem() {
        view?.showItem(item)
    }
}
