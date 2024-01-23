//
//  UITableViewExtension.swift
//  ImikoCrypto
//
//  Created by CT4TuEI3 on 23.01.2024.
//


import UIKit

extension UITableView {
    func registerClass<T: UITableViewCell>(_: T.Type) {
        self.register(T.self, forCellReuseIdentifier: String(describing: T.self))
    }
    
    func dequeueReusableCellForIndexPath<T: UITableViewCell>(_ indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as! T
    }
}
