//
//  CustomModifiers.swift
//  Zomato
//
//  Created by Esakki-IOS on 19/07/20.
//

import SwiftUI

struct CustomModifiers: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}
extension View {
    func standardButtonStyle() -> some View {
        self.modifier(CustomModifiers())
    }
}
