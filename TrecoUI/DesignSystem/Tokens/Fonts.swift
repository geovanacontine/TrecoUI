//
//  Fonts.swift
//  TrecoUI
//
//  Created by Geovana Contine on 13/08/22.
//

import SwiftUI

// MARK: - FontFamily

public enum FontFamily: String {
    case base = "Montserrat"
}

// MARK: - FontSize

public enum FontSize: String {
    case xxxs
    case xxs
    case xs
    case sm
    case md
    case lg
}

public extension FontSize {
    var value: CGFloat {
        let fontSizeToken = "font-size-" + rawValue
        return TokensManager.shared.getFloatValue(fontSizeToken) ?? 0
    }
}

// MARK: - FontWeight

public enum FontWeight: String {
    case light
    case regular
    case medium
    case semiBold
    case bold
}

// MARK: - FontStyle

public enum FontStyle: String {
    case heading1
    case heading2
    case heading3
    case heading4
    case paragraph
    case description
    case caption
    
    public init(fromRawValue rawValue: String) {
        self = FontStyle(rawValue: rawValue) ?? .paragraph
    }
}

public extension FontStyle {
    var size: FontSize {
        switch self {
        case .heading1:
            return .lg
        case .heading2:
            return .md
        case .heading3:
            return .sm
        case .heading4:
            return .xs
        case .paragraph:
            return .xs
        case .description:
            return .xxs
        case .caption:
            return .xxxs
        }
    }
    
    var weight: FontWeight {
        switch self {
        case .heading1:
            return .bold
        case .heading2:
            return .bold
        case .heading3:
            return .semiBold
        case .heading4:
            return .semiBold
        case .paragraph:
            return .regular
        case .description:
            return .regular
        case .caption:
            return .light
        }
    }
    
    var color: Color {
        switch self {
        case .description, .caption:
            return Colors.neutralDark2.color
        default:
            return Colors.neutralDarkPure.color
        }
    }
    
    var family: FontFamily {
        return .base
    }
}

// MARK: - TextStyle

public struct TextStyle: ViewModifier {
    
    private let style: FontStyle
    private let color: Color?
    
    public init(style: FontStyle, color: Color? = nil) {
        self.style = style
        self.color = color
    }
    
    private var fontName: String {
        style.family.rawValue + "-" + style.weight.rawValue.capitalized
    }
    
    private var fontSize: CGFloat {
        style.size.value
    }
    
    public func body(content: Content) -> some View {
        content
            .font(.custom(fontName, size: fontSize))
            .foregroundColor(color ?? style.color)
    }
}

public extension View {
    func textStyle(_ style: FontStyle, color: Color? = nil) -> some View {
        modifier(TextStyle(style: style, color: color))
    }
}
