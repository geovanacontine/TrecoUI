//
//  Shadow.swift
//  TrecoUI
//
//  Created by Pedro Contine on 13/08/22.
//

import SwiftUI

public enum Shadow: String {
    case xs
    case sm
}

public extension Shadow {
    var offset: CGSize {
        let shadowOffsetToken = "shadow-offset-" + rawValue
        let height = TokensManager.shared.getFloatValue(shadowOffsetToken) ?? 0
        return .init(width: 0, height: height)
    }
    
    var radius: CGFloat {
        let shadowRadiusToken = "shadow-radius-" + rawValue
        return TokensManager.shared.getFloatValue(shadowRadiusToken) ?? 0
    }
}

// MARK: - Extensions

public struct ShadowModifier: ViewModifier {
    
    let shadow: Shadow
    let color: Colors
    
    public func body(content: Content) -> some View {
        content
            .shadow(color: color.color,
                    radius: shadow.radius,
                    x: -shadow.offset.width,
                    y: shadow.offset.height)
    }
}

public extension View {
    func addShadow(_ shadow: Shadow, color: Colors = .neutralDarkPure) -> some View {
        modifier(ShadowModifier(shadow: shadow, color: color))
    }
}
