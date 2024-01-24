// 
//  DetailBuilder.swift
//  ImikoCrypto
//
//  Created by CT4TuEI3 on 23.01.2024.
//


import UIKit

final class DetailBuilder {
    static func createDetailModule(item:  CryptoData) -> UIViewController {
        let view = DetailViewController(item: item)
        let presenter = DetailPresenter(view: view)
        view.presenter = presenter
        return view
    }
}
