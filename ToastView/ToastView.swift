//
//  ToastView.swift
//  ToastView
//
//  Created by Weerawut Chaiyasomboon on 20/1/2568 BE.
//

import SwiftUI

struct ToastView: View {
    let text: String
    @Binding var showToast: Bool
    
    var body: some View {
        TextWithBackgroundView(text: text)
            .offset(y: showToast ? 0 : 100)
            .animation(.spring, value: showToast)
            .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

#Preview {
    ToastView(text: "Hooola!", showToast: .constant(true))
}

struct ToastModifier: ViewModifier {
    let text: String
    @Binding var showToast: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            TextWithBackgroundView(text: text)
                .offset(y: showToast ? 0 : 100)
                .animation(.spring, value: showToast)
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

extension View {
    func toast(text: String, showToast: Binding<Bool>) -> some View {
        self
            .modifier(ToastModifier(text: text, showToast: showToast))
    }
}
