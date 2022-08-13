//
//  Opacity.swift
//  TrecoUI
//
//  Created by Pedro Contine on 13/08/22.
//

import CoreGraphics

public enum Opacity: String {
    case none
    case semiOpaque
    case intense
    case medium
    case light
}

public extension Opacity {
    var value: CGFloat {
        let opacityToken = "opacity-" + rawValue
        return TokensManager.shared.getFloatValue(opacityToken) ?? 0
    }
}
