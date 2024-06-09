//
//  View.swift
//  OneCask
//
//  Created by Lukáš Spurný on 09.06.2024.
//

import SwiftUI

extension View {
    @ViewBuilder
    func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove { self.hidden() }
        } else {
            self
        }
    }
}
