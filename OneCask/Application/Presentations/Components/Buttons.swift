//
//  Buttons.swift
//  OneCask
//
//  Created by Lukáš Spurný on 09.06.2024.
//

import SwiftUI

struct YellowBorderedButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            //.padding()
            .background(Color("yellowColor").cornerRadius(8))
            .foregroundStyle(Color("backgroundDarkColor"))
    }
}
