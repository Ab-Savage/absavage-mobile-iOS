//
//  Subscription.swift
//  absavage-ios
//
//  Created by MEKARI on 26/11/22.
//

import Foundation

enum Subscription {
    case monthly
    case yearly
    
    var name: String {
        switch self {
        case .monthly:
            return "Monthly"
        case .yearly:
            return "Yearly"
        }
    }
    
    var description: String {
        switch self {
        case .monthly:
            return "Pay monthly, cancel any time"
        case .yearly:
            return "Pay for a full year"
        }
    }
    
    var perString: String {
        switch self {
        case .monthly:
            return "/m"
        case .yearly:
            return "/y"
        }
    }
    
    var price: Double {
        switch self {
        case .monthly:
            return 19.99
        case .yearly:
            return 129.99
        }
    }
}
