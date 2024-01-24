//
//  MainPresenter.swift
//  ImikoCrypto
//
//  Created by CT4TuEI3 on 23.01.2024.
//


import Foundation

protocol MainViewControllerProtocol: AnyObject {
    func setDataSource(_ data: [CryptoData])
    func stopUpdating()
    func showErrorAlert(_ message: String)
}

protocol MainPresenterProtocol {
    func getData(offset: Int)
}

final class MainPresenter {
    
    // MARK: - Private properties
    
    private weak var view: MainViewControllerProtocol?
    private let networkService: NetworkServiceProtocol?
    private var lastId: String?
    
    
    // MARK: - Lifecycle
    
    init(view: MainViewControllerProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
    }
}


// MARK: - MainPresenterProtocol

extension MainPresenter: MainPresenterProtocol {
    func getData(offset: Int) {
        networkService?.getData(offset: offset, limit: 10, success: { [weak self] response in
            guard let self else { return }
            if response.data.last?.id != self.lastId {
                self.view?.setDataSource(response.data)
            } else {
                self.view?.stopUpdating()
            }
            self.lastId = response.data.last?.id
        }, failure: { errorMessage in
            guard let errorMessage else { return }
            self.view?.showErrorAlert(errorMessage)
        })
    }
}
