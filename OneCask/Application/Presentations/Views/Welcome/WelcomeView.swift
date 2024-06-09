//
//  WelcomeView.swift
//  OneCask
//
//  Created by Lukáš Spurný on 09.06.2024.
//

import SwiftUI

struct WelcomeView: View {
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    @StateObject private var viewModel: WelcomeViewModel
    
    @EnvironmentObject private var viewRouter: ViewRouter
    
    // MARK: - Lifecycle
    
    init(viewModel: WelcomeViewModel = .init()) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        BackgroundComponentView {
            contentView()
        }
    }
    
    private func contentView() -> some View {
        VStack {
            Spacer()
            welcomeContentView()
        }
    }
    
    private func welcomeContentView() -> some View {
        VStack(spacing: 24) {
            VStack(spacing: 8) {
                Label(text: "Welcome!", fontSize: 32, bold: true, alignment: .center)
                Label(text: "Text text text", alignment: .center)
            }
            
            Button {
                print("TUDU: Scan bottle TAPPED")
            } label: {
                Label(text: "Scan bottle", bold: true, color: Color("backgroundDarkColor"), alignment: .center)
                    .frame(height: 56)
            }
            .buttonStyle(YellowBorderedButton())
            
            
            HStack(spacing: 8) {
                Label(text: "Have an account?", fontSize: 16, color: Color("grayColor"), alignment: .center)
                Button {
                    viewRouter.currentRoot = .signIn
                } label: {
                    Label(text: "Sign in first", bold: true, color: Color("yellowColor"),  alignment: .center)
                        .frame(height: 56)
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 24)
        .background(Color("contentDarkColor"))
    }
}

#Preview {
    WelcomeView()
}
