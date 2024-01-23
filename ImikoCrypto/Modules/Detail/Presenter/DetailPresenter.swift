// 
//  DetailPresenter.swift
//  ImikoCrypto
//
//  Created by CT4TuEI3 on 23.01.2024.
//


import Foundation

protocol DetailViewControllerProtocol: AnyObject {
    
}

protocol DetailPresenterProtocol {
    
}

final class DetailPresenter {
    
    // MARK: - Private properties
    
    private weak var view: DetailViewControllerProtocol?
    
    
    // MARK: - Lifecycle
    
    init(view: DetailViewControllerProtocol) {
        self.view = view
    }
}

// MARK: - DetailPresenterProtocol

extension DetailPresenter: DetailPresenterProtocol {
    
}
