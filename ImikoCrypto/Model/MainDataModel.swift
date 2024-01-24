//
//  MainDataModel.swift
//  ImikoCrypto
//
//  Created by CT4TuEI3 on 24.01.2024.
//


import Foundation

struct MainDataModel: Decodable {
    let data: [CryptoData]
}

struct CryptoData: Decodable {
    let id: String
    let symbol: String
    let name: String
    let priceUsd: String
    let changePercent24Hr: String
    
    let vwap24Hr: String?
    let marketCapUsd: String
    let maxSupply: String?
    let volumeUsd24Hr: String
}
