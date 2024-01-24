//
//  UIViewControllerExtension.swift
//  ImikoCrypto
//
//  Created by CT4TuEI3 on 24.01.2024.
//


import UIKit

extension UIViewController {
    func showSystemErrorAlert(message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: LocalizedText.ErrorAlert.errorTitle,
                                          message: message,
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: LocalizedText.ErrorAlert.close,
                                          style: .destructive))
            self.present(alert, animated: true)
        }
    }
}
