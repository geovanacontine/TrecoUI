//
//  SDProductSettings.swift
//  TrecoUI
//
//  Created by Geovana Contine on 13/08/22.
//

import UIKit
import SwiftUI

protocol SDProductSettingsProtocol {
    var navigationTitleColor: Color { get }
    var hasNavigationBarShadow: Bool { get }
    
    func setup()
}

final class SDProductSettings: SDProductSettingsProtocol {
    
    static let shared = SDProductSettings()
    private init() {}
    
    var navigationTitleColor: Color {
        let token = TokensManager.shared.getValue("navigationBar-titleColor") ?? "neutralDarkPure"
        return Colors.init(fromRawValue: token).color
    }
    
    var hasNavigationBarShadow: Bool {
        let token = TokensManager.shared.getValue("navigationBar-hasShadow") ?? "false"
        return Bool(token) ?? false
    }
    
    func setup() {
        TokensManager.shared.setTheme(fromJson: "tokens")
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        let manager = TokensManager.shared
        let styleToken = manager.getValue("navigationBar-statusBarStyle") ?? "dark"
        let backgroundToken = manager.getValue("navigationBar-backgroundColor") ?? "neutralLightPure"
        let tintColorToken = manager.getValue("navigationBar-titleColor") ?? "neutralDarkPure"
        
        let barStyle = SDStatusBarStyle(rawValue: styleToken) ?? .light
        let backgroundColor = Colors.init(fromRawValue: backgroundToken).color
        let tintColor = Colors.init(fromRawValue: tintColorToken).color
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(backgroundColor)
        appearance.titleTextAttributes = [.foregroundColor: tintColor]
        appearance.shadowColor = .clear
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UIApplication.shared.statusBarStyle = barStyle.systemStyle
    }
}
