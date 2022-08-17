//
//  SDNavigationAction.swift
//  TrecoUI
//
//  Created by Geovana Contine on 17/08/22.
//

import Foundation

struct SDNavigationAction: SDAction {
    let data: SDNavigationAction.Data
    
    func execute() {
        let view = SDGenericView(viewName: data.viewName ?? "").toAny()
        let style = NavigationTransitionStyle(fromRawValue: data.style ?? "")
        Coordinator.shared.show(view, style: style)
    }
}

extension SDNavigationAction {
    struct Data: Decodable {
        let viewName: String?
        let style: String?
    }
}
