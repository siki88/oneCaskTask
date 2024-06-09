//
//  CollectionsViewModel.swift
//  OneCask
//
//  Created by Lukáš Spurný on 09.06.2024.
//

import Foundation
//import Combine

final class CollectionsViewModel: ObservableObject {
    // MARK: - Public properties
    
    @Published var presented: Bool = false
    @Published var presentedModel: Int = 0
    
    // MARK: - Private properties
    
    //private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Lifecycle
    
    init() {}
}

// MARK: - Public methods

//extension CollectionsViewModel {}

// MARK: - Private methods

//private extension CollectionsViewModel {}
