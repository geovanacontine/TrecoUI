//
//  SDGenericView.swift
//  TrecoUI
//
//  Created by Pedro Contine on 13/08/22.
//

import SwiftUI

struct SDGenericView: View {
    
    @ObservedObject var controller: SDGenericViewController
    private let productSettings: SDProductSettingsProtocol
    
    init(viewName: String,
         productSettings: SDProductSettingsProtocol = SDProductSettings.shared) {
        
        self.controller = SDGenericViewController(viewName: viewName)
        self.productSettings = productSettings
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(Colors.neutralLightPure.color)
                .frame(height: 1)
                .addShadow(.xs, color: .neutralDark3)
                .isVisible(productSettings.hasNavigationBarShadow)
            Group {
                if controller.isLoading {
                    SDLoadingView()
                } else {
                    ScrollView(scrollAxes, showsIndicators: false) {
                        HStack {
                            SpacerView(horizontal: .xs)
                            LazyVStack {
                                SpacerView(vertical: .xs)
                                ForEach(controller.view?.body ?? [], id: \.tag) { component in
                                    component.render()
                                }
                            }
                            SpacerView(horizontal: .xs)
                        }
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("")
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(controller.view?.header?.title ?? "")
                    .textStyle(.heading4, color: productSettings.navigationTitleColor)
                    .frame(minWidth: 200)
            }
        }
        .task {
            await controller.loadView()
        }
    }
    
    private var scrollAxes: Axis.Set {
        let canScroll = controller.view?.settings?.canScroll ?? true
        return canScroll ? .vertical : []
    }
}
