//
//  SignInViewModel.swift
//  OneCask
//
//  Created by Lukáš Spurný on 09.06.2024.
//

import Foundation
//import Combine

final class SignInViewModel: ObservableObject {
    // MARK: - Public properties
    
    @Published var emailText: String = ""
    
    @Published var passwordText: String = ""
    
    @Published var showPassword: Bool = false
    
    // MARK: - Private properties
    
    //private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Lifecycle
    
    init() {}
}

// MARK: - Public methods

//extension WelcomeViewModel {}

// MARK: - Private methods

//private extension WelcomeViewModel {}
