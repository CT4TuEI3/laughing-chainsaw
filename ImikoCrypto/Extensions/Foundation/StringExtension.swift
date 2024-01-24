//
//  StringExtension.swift
//  ImikoCrypto
//
//  Created by CT4TuEI3 on 24.01.2024.
//


import Foundation

extension String {
    func currencyFormatting() -> String {
        if let value = Double(self) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.maximumFractionDigits = 2
            formatter.minimumFractionDigits = 2
            if let str = formatter.string(for: value) {
                return str
            }
        }
        return ""
    }
    
    func percentFormatting() -> String {
        if let value = Double(self) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .percent
            formatter.maximumFractionDigits = 2
            formatter.minimumFractionDigits = 2
            if let str = formatter.string(for: value) {
                return str
            }
        }
        return ""
    }
    
    func bigCurrencyFormatter(isSupply: Bool? = nil) -> String {
        if let value = Double(self) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 2
            formatter.minimumFractionDigits = 2
            switch value {
                case 10_000 ... 99_999:
                    if let formattedNumber = formatter.string(from: NSNumber(value: value / 10_000)) {
                        if isSupply != nil {
                            return "\(formattedNumber)k"
                        } else {
                            return "$\(formattedNumber)k"
                        }
                    }
                case 100_000 ... 999_999:
                    if let formattedNumber = formatter.string(from: NSNumber(value: value / 100_000)) {
                        if isSupply != nil {
                            return "\(formattedNumber)k"
                        } else {
                            return "$\(formattedNumber)k"
                        }
                    }
                case 1_000_000 ... 999_999_999:
                    if let formattedNumber = formatter.string(from: NSNumber(value: value / 1_000_000)) {
                        if isSupply != nil {
                            return "\(formattedNumber)m"
                        } else {
                            return "$\(formattedNumber)m"
                        }
                    }
                case 1_000_000_000 ... 999_999_999_999:
                    if let formattedNumber = formatter.string(from: NSNumber(value: value / 1_000_000_000)) {
                        if isSupply != nil {
                            return "\(formattedNumber)b"
                        } else {
                            return "$\(formattedNumber)b"
                        }
                    }
                default:
                    if let formattedNumber = formatter.string(from: NSNumber(value: value)) {
                        return "$\(formattedNumber)"
                    }
            }
        }
        return "0"
    }
}
