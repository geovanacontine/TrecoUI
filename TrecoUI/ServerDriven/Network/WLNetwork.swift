//
//  SDNetwork.swift
//  TrecoUI
//
//  Created by Pedro Contine on 13/08/22.
//

import Foundation

enum SDViewType {
    case local
    case remote
}

protocol SDNetworkProtocol {
    func getView(named viewName: String, type: SDViewType) async -> SDView
}

final class SDNetwork: SDNetworkProtocol {
    
    func getView(named viewName: String, type: SDViewType) async -> SDView {
        switch type {
        case .local:
            return getLocalView(named: viewName) ?? getNotFoundView()
        case .remote:
            return await getRemoteView(named: viewName) ?? getNotFoundView()
        }
    }
}

extension SDNetwork {
    private func getRemoteView(named viewName: String) async -> SDView? {
        getLocalView(named: viewName)
    }
    
    private func getLocalView(named viewName: String) -> SDView? {
        guard let url = Bundle.main.url(forResource: viewName, withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            return nil
        }
        
        return try? JSONDecoder().decode(SDView.self, from: data)
    }
    
    private func getNotFoundView() -> SDView {
        getLocalView(named: SDLocalViews.notFound.rawValue) ?? .init(body: [], header: nil)
    }
}
