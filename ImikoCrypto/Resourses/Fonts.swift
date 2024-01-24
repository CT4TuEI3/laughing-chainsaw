//
//  Fonts.swift
//  ImikoCrypto
//
//  Created by CT4TuEI3 on 23.01.2024.
//


import UIKit

final class Typography {
    private class func expandedSemibold(of size: CGFloat) -> UIFont {
        return UIFont(name: "SFPro-ExpandedSemibold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .semibold)
    }
    
    private class func regular(of size: CGFloat) -> UIFont {
        return UIFont(name: "SFPro-Regular", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
}

extension Typography {
    static var expandedSemibold24: UIFont {
        Typography.expandedSemibold(of: 24)
    }
    
    static var regular12: UIFont {
        Typography.regular(of: 12)
    }
    
    static var regular14: UIFont {
        Typography.regular(of: 14)
    }
    
    static var regular16: UIFont {
        Typography.regular(of: 16)
    }
    
    static var regular24: UIFont {
        Typography.regular(of: 24)
    }
}
