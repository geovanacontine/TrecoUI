//
//  SDButtonComponent.swift
//  TrecoUI
//
//  Created by Geovana Contine on 17/08/22.
//

import SwiftUI

struct SDButtonComponent: SDComponent {
    let tag: String
    let data: ButtonView.Data
    
    func render() -> AnyView {
        ButtonView(data: data).toAny()
    }
}

struct ButtonView: View {
    let data: Data
    
    private var buttonStyle: ButtonStyle {
        .init(fromRawValue: data.style ?? "")
    }
    
    var body: some View {
        HStack {
            SpacerView(horizontal: .xs)
            HStack {
                Spacer()
                Image(systemName: data.icon ?? "")
                    .textStyle(.heading4,
                               color: buttonStyle.textColor.color)
                SpacerView(horizontal: .xs)
                Text(data.title ?? "")
                    .textStyle(.heading4,
                               color: buttonStyle.textColor.color)
                Spacer()
            }
            .padding()
            .background(buttonStyle.backgroundColor.color)
            .addBorder(radius: .xl)
            SpacerView(horizontal: .xs)
        }
        .background(Colors.neutralLightPure.color)
    }
}

extension ButtonView {
    struct Data: Decodable {
        let icon: String?
        let title: String?
        let style: String?
    }
    
    enum ButtonStyle: String {
        case primary
        case secondary
        case tertiary
        
        init(fromRawValue rawValue: String) {
            self = ButtonStyle(rawValue: rawValue) ?? .primary
        }
        
        var backgroundColor: Colors {
            switch self {
            case .primary:
                return .brandPure
            case .secondary:
                return .neutralLight2
            case .tertiary:
                return .clear
            }
        }
        
        var textColor: Colors {
            switch self {
            case .primary:
                return .neutralLightPure
            case .secondary:
                return .neutralDarkPure
            case .tertiary:
                return .brandPure
            }
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ButtonView(data: .init(icon: "arrow.clockwise",
                                   title: "Title",
                                   style: "primary"))
            ButtonView(data: .init(icon: "arrow.clockwise",
                                   title: "Title",
                                   style: "secondary"))
            ButtonView(data: .init(icon: nil,
                                   title: "Title",
                                   style: "tertiary"))
        }
    }
}
