//
//  BackgroundComponentView.swift
//  OneCask
//
//  Created by Lukáš Spurný on 09.06.2024.
//

import SwiftUI

struct BackgroundComponentView<Content: View>: View {
    // MARK: - Public properties
    
    @State var backgroundColor: Color = Color("backgroundDarkColor")
    @State var backgroundImage: Image? = Image(.mainBackground)
    @State var bottomPadding: CGFloat = 16
    
    @ViewBuilder var content: () -> Content
    
    // MARK: - Private properties
    
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    
    // MARK: - Lifecycle
    
    public var body: some View {
        ZStack {
            if let backgroundImage {
                backgroundColor
                    .overlay(
                        backgroundImage
                            .padding(.top, safeAreaInsets.top)
                    )
                    .ignoresSafeArea()
            } else {
                backgroundColor
                    .ignoresSafeArea()
            }
            content()
                .padding(.horizontal, 16)
                .padding(.bottom, bottomPadding)
        }
    }
}

