//
//  NetworkService.swift
//  ImikoCrypto
//
//  Created by CT4TuEI3 on 24.01.2024.
//


import Foundation

protocol NetworkServiceProtocol {
    func getData(offset: Int, limit: Int, completion: @escaping (MainDataModel) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    func getData(offset: Int, limit: Int, completion: @escaping (MainDataModel) -> Void) {
        guard let url = URL(string: Configure.baseURL + "/?offset=\(offset)&limit=\(limit)") else { return }
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else { fatalError() }
            do {
                let currentData = try JSONDecoder().decode(MainDataModel.self, from: data)
                completion(currentData)
            } catch {
                print("👺Error parsing")
            }
        }.resume()
    }
}
