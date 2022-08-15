//
//  Border.swift
//  TrecoUI
//
//  Created by Pedro Contine on 13/08/22.
//

import SwiftUI

// MARK: - BorderWidth

public enum BorderWidth: String, Decodable {
    case none
    case thin
    case thick
    case thicker
    
    var value: CGFloat {
        let tokenPrefix = "border-width-"
        let borderWidthToken = tokenPrefix + rawValue
        return TokensManager.shared.getFloatValue(borderWidthToken) ?? 0
    }
}

// MARK: - BorderRadius

public enum BorderRadius: String, Decodable {
    case none
    case sm
    case md
    case lg
    
    var value: CGFloat {
        let borderRadiusToken = "border-radius-" + rawValue
        return TokensManager.shared.getFloatValue(borderRadiusToken) ?? 0
    }
}

// MARK: - Extensions

public extension View {
    func addBorder(radius: BorderRadius,
                   width: BorderWidth = .none,
                   color: Colors = .clear) -> some View {
        
        let roundedRect = RoundedRectangle(cornerRadius: radius.value)
        return clipShape(roundedRect).overlay(roundedRect.strokeBorder(color.color, lineWidth: width.value))
    }
}
