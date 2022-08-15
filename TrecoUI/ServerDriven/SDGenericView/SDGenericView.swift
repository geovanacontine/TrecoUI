//
//  SDGenericView.swift
//  TrecoUI
//
//  Created by Geovana Contine on 13/08/22.
//

import SwiftUI
import SwiftUIPullToRefresh

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
                    RefreshableScrollView(showsIndicators: false) {
                        await controller.refreshView()
                    } progress: { state in
                        RefreshActivityIndicator(isAnimating: state == .loading) { view in
                            view.color = UIColor(Colors.brandPure.color)
                            view.hidesWhenStopped = false
                        }
                    } content: {
                        HStack {
                            LazyVStack {
                                SpacerView(vertical: .xs)
                                ForEach(controller.view?.body ?? [], id: \.tag) { component in
                                    component.render()
                                }
                            }
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
