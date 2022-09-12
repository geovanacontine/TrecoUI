//
//  ComponentDetalView.swift
//  Product Setup
//
//  Created by Geovana Contine on 02/09/22.
//

import SwiftUI
import CodeEditor

struct ComponentDetailView: View {
    
    private let name: String
    private var source: String = ""
    
    init(name: String) {
        self.name = name
        source = readLocalFile(forName: name) ?? ""
    }
    
    var body: some View {
        VStack {
            Image(name)
                .padding()
            CodeEditor(
                source: source,
                language: .json,
                theme: .atelierSavannaDark,
                flags: [.selectable, .smartIndent]
            )
        }
        .padding()
    }
    
    private func readLocalFile(forName name: String) -> String? {
        guard let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
              let jsonString = try? String(contentsOfFile: bundlePath) else {
            return nil
        }
        
        return jsonString
    }
}
