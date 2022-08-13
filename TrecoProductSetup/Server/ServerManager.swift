//
//  ServerManager.swift
//  TrecoProductSetup
//
//  Created by Pedro Contine on 13/08/22.
//

import Foundation
import Swifter

class ServerManager {
    
    static let shared = ServerManager()
    private let server = HttpServer()
    
    private init() {
        setupRoutes()
        start()
    }
    
    var isOn: Bool = false
    
    private func setupRoutes() {
        server["/view/:path"] = { [weak self] request in
            self?.handleResponse(request: request) ?? .internalServerError
        }
    }
    
    private func start() {
        do {
            try server.start(SDServerSettings.port)
            isOn = true
        } catch {
            isOn = false
        }
    }
    
    private func handleResponse(request: HttpRequest) -> HttpResponse {
        guard let jsonName = request.params.first?.value,
              let response = loadJson(named: jsonName) else {
            return .notFound
        }
        
        return .ok(.data(response, contentType: "application/json"))
    }
    
    private func loadJson(named jsonName: String) -> Data? {
        guard let url = Bundle.main.url(forResource: jsonName, withExtension: "json") else {
            return nil
        }
        
        return try? Data(contentsOf: url)
    }
}
