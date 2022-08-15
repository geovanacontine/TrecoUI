//
//  TokensManager.swift
//  TrecoUI
//
//  Created by Geovana Contine on 13/08/22.
//

import Foundation
import CoreGraphics

public class TokensManager {
    public static let shared = TokensManager()
    private var tokens: [String: String] = [:]
    private init() {}
}

// MARK: - Public methods

extension TokensManager {
    public func setTheme(fromJson jsonName: String) {
        let jsonData = loadTokensFromJson(named: jsonName)
        tokens = jsonData ?? [:]
    }
    
    public func getValue<T>(_ token: String) -> T? {
        tokens[token] as? T
    }
}

// MARK: - Internal methods

extension TokensManager {
    func getStringValue(_ token: String) -> String? {
        tokens[token]
    }
    
    func getFloatValue(_ token: String) -> CGFloat? {
        guard let stringToken = getStringValue(token),
              let doubleToken = Double(stringToken) else {
            return nil
        }
        
        return CGFloat(doubleToken)
    }
}

// MARK: - Private methods

extension TokensManager {
    private func loadTokensFromJson(named jsonName: String) -> [String: String]? {
        guard let url = Bundle.main.url(forResource: jsonName, withExtension: "json") else {
            return nil
        }
        
        let data = (try? Data(contentsOf: url)) ?? Data()
        let decoder = JSONDecoder()
        return try? decoder.decode([String: String].self, from: data)
    }
}
