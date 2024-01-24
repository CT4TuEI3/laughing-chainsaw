//
//  NetworkService.swift
//  ImikoCrypto
//
//  Created by CT4TuEI3 on 24.01.2024.
//


import Foundation

protocol NetworkServiceProtocol {
    func getData(offset: Int,
                 limit: Int,
                 success: @escaping (MainDataModel) -> Void,
                 failure: @escaping (String?) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    func getData(offset: Int,
                 limit: Int,
                 success: @escaping (MainDataModel) -> Void,
                 failure: @escaping (String?) -> Void) {
        guard let url = URL(string: Configure.baseURL + "/?offset=\(offset)&limit=\(limit)") else { return }
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data, error == nil else {
                failure(error?.localizedDescription)
                return
            }
            do {
                let currentData = try JSONDecoder().decode(MainDataModel.self, from: data)
                success(currentData)
            } catch {
                failure("Error 👺")
            }
        }.resume()
    }
}
