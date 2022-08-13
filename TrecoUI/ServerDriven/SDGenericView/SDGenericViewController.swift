//
//  SDGenericViewController.swift
//  TrecoUI
//
//  Created by Pedro Contine on 13/08/22.
//

import Combine

final class SDGenericViewController: ObservableObject {
    
    @Published var view: SDView?
    @Published var isLoading = false
    
    private let viewName: String
    private let network: SDNetworkProtocol
    
    init(viewName: String, network: SDNetworkProtocol = SDNetwork()) {
        self.viewName = viewName
        self.network = network
    }
    
    @MainActor
    func loadView() async {
        guard view == nil else {
            return
        }
        
        isLoading = true
        view = await network.getView(named: viewName, type: .remote)
        isLoading = false
    }
    
    @MainActor
    func refreshView() async {
        try? await Task.sleep(seconds: 1)
        view = await network.getView(named: viewName, type: .remote)
    }
}
