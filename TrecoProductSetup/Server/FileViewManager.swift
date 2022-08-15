//
//  FileViewManager.swift
//  ProductSetup
//
//  Created by Geovana Contine on 14/08/22.
//

import Combine
import Foundation

class FileViewManager: ObservableObject {
    
    static let shared = FileViewManager()
    @Published var views: [String] = []
    
    private let defaults: UserDefaults
    private let prefix = "jsonView/"
    
    private init(defaults: UserDefaults = UserDefaults.standard) {
        self.defaults = defaults
        loadViews()
    }
    
    func loadJsonText(forView viewName: String) -> String? {
        guard let jsonData = loadJsonData(forView: viewName) else {
            return nil
        }
        
        return String(data: jsonData, encoding: .utf8)
    }
    
    func loadJsonData(forView viewName: String) -> Data? {
        guard let data = defaults.data(forKey: prefix + viewName),
              let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) else {
            return nil
        }
        
        return try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
    }
    
    func saveFile(oldName: String, newName: String, text: String) {
        if newName != oldName {
            deleteFile(name: oldName)
        }
        
        saveJson(text: text, name: newName)
    }
    
    func deleteFile(name: String) {
        let viewPath = prefix + name
        defaults.removeObject(forKey: viewPath)
        loadViews()
    }
}

extension FileViewManager {
    private func saveJson(text: String, name: String) {
        guard let data = text.data(using: .utf8),
              let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves),
              let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
            return
        }
        
        let viewPath = prefix + name
        defaults.set(jsonData, forKey: viewPath)
        loadViews()
    }
    
    private func loadViews() {
        let defaultKeys = defaults.dictionaryRepresentation().keys
        let views = defaultKeys.filter({ $0.contains(prefix) })
        let viewNames = views.map({ $0.replacingOccurrences(of: prefix, with: "") })
        self.views = viewNames.sorted { $0 < $1 }
    }
}
