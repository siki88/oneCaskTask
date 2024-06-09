//
//  GlobalConfigurations.swift
//  OneCask
//
//  Created by Lukáš Spurný on 09.06.2024.
//

import SwiftUI

enum TypeAuthorize {
    case authorize
    case unauthorize
}

class GlobalConfigurations: ObservableObject {
    
    static var shared = GlobalConfigurations()
    
    @Published var typeAuthorize: TypeAuthorize = .unauthorize
}
