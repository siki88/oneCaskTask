//
//  Labels.swift
//  OneCask
//
//  Created by Lukáš Spurný on 09.06.2024.
//

import SwiftUI

#warning("implement font")

struct Label: View {
    var text: String
    var fontSize: CGFloat = 16
    var bold: Bool = false
    var color: Color = .white
    var alignment: Alignment = .leading
    var maxWidth: CGFloat? = .infinity
    
    var body: some View {
        Text(text)
            .font(.system(size: fontSize))
            .foregroundColor(color)
            .bold(bold)
            .frame(maxWidth: maxWidth, alignment: alignment)
    }
}


struct LabelMultiline: View {
    var text: String
    var fontSize: CGFloat = 16
    var bold: Bool = false
    var color: Color = .white
    var alignment: Alignment = .leading
    var textAlignment: TextAlignment = .leading
    var maxWidth: CGFloat? = .infinity
    var lineLimit: Int? = nil
    
    var body: some View {
        Text(text)
            .font(.system(size: fontSize))
            .foregroundColor(color)
            .bold(bold)
            .frame(maxWidth: maxWidth, alignment: alignment)
            .multilineTextAlignment(textAlignment)
            .lineLimit(lineLimit)
    }
}

 //.fixedSize(horizontal: false, vertical: true)
