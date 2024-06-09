//
//  CollectionViewModel.swift
//  OneCask
//
//  Created by Lukáš Spurný on 09.06.2024.
//

import Foundation
//import Combine

enum CollectionContentType {
    case detail
    case tastingNote
    case history
}

final class CollectionViewModel: ObservableObject {
    // MARK: - Public properties
    
    @Published var model: Int
    
    @Published var collectionContentType: CollectionContentType = .detail
    
    // MARK: - Private properties
    
    //private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Lifecycle
    
    init(model: Int) {
        self.model = model
    }
}

// MARK: - Public methods

//extension CollectionViewModel {}

// MARK: - Private methods

//private extension CollectionViewModel {}
