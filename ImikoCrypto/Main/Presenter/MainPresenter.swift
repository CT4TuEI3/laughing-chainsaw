//
//  MainPresenter.swift
//  ImikoCrypto
//
//  Created by CT4TuEI3 on 23.01.2024.
//


import Foundation

protocol MainViewControllerProtocol: AnyObject {
    func setDataSource(_ data: [CryptoData])
}

protocol MainPresenterProtocol {
    func getData()
}

final class MainPresenter {
    
    // MARK: - Private properties
    
    private weak var view: MainViewControllerProtocol?
    private let networkService: NetworkServiceProtocol?
    
    
    // MARK: - Lifecycle
    
    init(view: MainViewControllerProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
    }
}


// MARK: - MainPresenterProtocol

extension MainPresenter: MainPresenterProtocol {
    func getData() {
        networkService?.getData(completion: { data in
            self.view?.setDataSource(data.data)
        })
    }
}
