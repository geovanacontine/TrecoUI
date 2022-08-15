//
//  Extensions.swift
//  TrecoUI
//
//  Created by Geovana Contine on 13/08/22.
//

import SwiftUI

extension Optional where Wrapped == String {
    var isNilOrEmpty: Bool {
        self?.isEmpty == true || self == nil
    }
}

extension View {
    func toAny() -> AnyView {
        return AnyView(self)
    }
}

extension View {
  @ViewBuilder
  func `if`<Transform: View>(_ condition: Bool, transform: (Self) ->  Transform) -> some View {
    if condition { transform(self) }
    else { self }
  }
}
