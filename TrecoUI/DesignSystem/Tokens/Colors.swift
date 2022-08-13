//
//  Colors.swift
//  TrecoUI
//
//  Created by Pedro Contine on 13/08/22.
//

import UIKit
import SwiftUI

public enum Colors: String, Decodable {
    case brandPure
    case brand2
    case brand3
    
    case neutralLightPure
    case neutralLight2
    case neutralLight3
    
    case neutralDarkPure
    case neutralDark2
    case neutralDark3
    
    case feedbackError
    case feedbackSuccess
    case feedbackInfo
    
    case clear
}

public extension Colors {
    init(fromRawValue rawValue: String) {
        self = Colors(rawValue: rawValue) ?? .neutralDarkPure
    }
    
    var color: Color {
        let colorToken = "color-" + rawValue
        let hex = TokensManager.shared.getStringValue(colorToken) ?? ""
        return .init(hex: hex) ?? Color.clear
    }
}

// MARK: - Extensions

extension Color {
    init?(hex: String) {
        let hexSanitized = hex
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        guard Scanner(string: hexSanitized).scanHexInt64(&rgb),
              hexSanitized.count == 6 else {
            return nil
        }
        
        self.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgb & 0x0000FF) / 255.0,
                  opacity: 1.0)
    }
}
