//
//  ServerManager.swift
//  TrecoProductSetup
//
//  Created by Geovana Contine on 13/08/22.
//

import Foundation
import Combine
import Swifter

class ServerManager: ObservableObject {
    
    private let server = HttpServer()
    
    init() {
        setupRoutes()
        start()
    }
    
    @Published var isOn: Bool = false
    
    func start() {
        do {
            try server.start(SDServerSettings.port)
            isOn = true
        } catch {
            isOn = false
        }
    }
    
    func stop() {
        server.stop()
        isOn = false
    }
}

extension ServerManager {
    private func setupRoutes() {
        server["/view/:path"] = { [weak self] request in
            self?.handleResponse(request: request) ?? .internalServerError
        }
    }
    
    private func handleResponse(request: HttpRequest) -> HttpResponse {
        guard let jsonName = request.params.first?.value,
              let response = FileViewManager.shared.loadJsonData(forView: jsonName) else {
            return .notFound
        }
        
        return .ok(.data(response, contentType: "application/json"))
    }
}
