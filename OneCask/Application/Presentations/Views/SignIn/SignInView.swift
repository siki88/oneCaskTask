//
//  SignInView.swift
//  OneCask
//
//  Created by Lukáš Spurný on 09.06.2024.
//

import SwiftUI

struct SignInView: View {
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    @StateObject private var viewModel: SignInViewModel
    
    @EnvironmentObject private var viewRouter: ViewRouter
    
    @EnvironmentObject private var internetAvailability: InternetAvailability
    
    // MARK: - Lifecycle
    
    init(viewModel: SignInViewModel = .init()) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        BackgroundComponentView(backgroundImage: nil) {
            contentView()
        }
    }
    
    private func contentView() -> some View {
        VStack(spacing: 16) {
            HStack {
                Button {
                    viewRouter.currentRoot = .welcome
                } label: {
                    Image("backArrowIcon")
                }
                Spacer()
            }
            
            Label(text: "Sign in", fontSize: 32, bold: true)
                .padding(.vertical, 24)
            
            textFieldscontentView()
            
            Button {
                switch internetAvailability.internetAvailabilityType {
                case .connection:
                    viewRouter.currentRoot = .bottomTabBar
                case .disconnection:
                    print("internet disconnected ACTION")
                }
            } label: {
                Label(text: "Continue", bold: true, color: Color("backgroundDarkColor"), alignment: .center)
                    .frame(height: 56)
            }
            .buttonStyle(YellowBorderedButton())
            .padding(.vertical, 40)
            
            HStack(spacing: 8) {
                Label(text: "Can’t sign in?", fontSize: 16, color: Color("grayColor"), alignment: .center)
                Button {
                    print("TUDU: Recover password TAPPED")
                } label: {
                    Label(text: "Recover password", bold: true, color: Color("yellowColor"),  alignment: .center)
                        .frame(height: 56)
                }
            }
            
            Spacer()
        }
    }
    
    private func textFieldscontentView() -> some View {
        VStack(spacing: 24) {
            TextField("", text: $viewModel.emailText)
                .textFieldStyle(
                    .floating(
                        borderColor: Color.clear,
                        titleStyle: .init(
                            text: "Email",
                            font: .system(size: 15),
                            floatingFont: .system(size: 12),
                            color: Color.white,
                            floatingColor: Color("yellowColor")
                        )
                    )
                )
            
            if viewModel.showPassword {
                TextField("", text: $viewModel.passwordText)
                    .textFieldStyle(
                        .floating(
                            borderColor: Color.clear,
                            showClearButton: false,
                            showEyeButton: true,
                            showPassword: viewModel.showPassword,
                            titleStyle: .init(
                                text: "Password",
                                font: .system(size: 15),
                                floatingFont: .system(size: 12),
                                color: Color.white,
                                floatingColor: Color("yellowColor")
                            ), eyeTapped: { value in
                                viewModel.showPassword = !value
                            }
                        )
                    )
            } else {
                SecureField("", text: $viewModel.passwordText)
                    .textFieldStyle(
                        .floating(
                            borderColor: Color.clear,
                            showClearButton: false,
                            showEyeButton: true,
                            showPassword: viewModel.showPassword,
                            titleStyle: .init(
                                text: "Password",
                                font: .system(size: 15),
                                floatingFont: .system(size: 12),
                                color: Color.white,
                                floatingColor: Color("yellowColor")
                            ), eyeTapped: { value in
                                viewModel.showPassword = !value
                            }
                        )
                    )
            }
        }
    }
}

#Preview {
    SignInView()
}
