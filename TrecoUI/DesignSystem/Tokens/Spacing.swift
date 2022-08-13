//
//  Spacing.swift
//  TrecoUI
//
//  Created by Pedro Contine on 13/08/22.
//

import SwiftUI

public enum Spacing: String {
    case none
    case us
    case xxxs
    case xxs
    case xs
    case sm
    case md
    case lg
    case xl
    case xxl
}

public extension Spacing {
    init(fromRawValue rawValue: String) {
        self = Spacing(rawValue: rawValue) ?? .none
    }
    
    var value: CGFloat {
        let spacingToken = "spacing-" + rawValue
        return TokensManager.shared.getFloatValue(spacingToken) ?? 0
    }
}

// MARK: - SpacerView

public struct SpacerView: View {
    
    private let vertical: Spacing
    private let horizontal: Spacing
    
    public init(vertical: Spacing = .none, horizontal: Spacing = .none) {
        self.vertical = vertical
        self.horizontal = horizontal
    }
    
    public var body: some View {
        Spacer()
            .frame(width: horizontal.value, height: vertical.value)
    }
}
