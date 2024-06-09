//
//  RootView.swift
//  OneCask
//
//  Created by Lukáš Spurný on 09.06.2024.
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var router: ViewRouter
    @State var isAnimated = false
    
    var body: some View {
        NavigationView {
            containedView(roots: router.currentRoot)
                .id(UUID().uuidString)
                .transition(.slide).animation(.linear(duration: 0.2), value: isAnimated)
                .onAppear() {
                    DispatchQueue.main.async {
                        isAnimated = true
                    }
                }
        }
        .navigationViewStyle(.stack)
    }
    
    func containedView(roots: Roots) -> AnyView {
        switch router.currentRoot {
        case .welcome: AnyView(WelcomeView())
        case .signIn: AnyView(SignInView())
        case .bottomTabBar: AnyView(BottomTabBar())
        }
    }
}
