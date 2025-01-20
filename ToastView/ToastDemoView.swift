//
//  ToastDemoView.swift
//  TextWithBackgroundView
//
//  Created by Weerawut Chaiyasomboon on 20/1/2568 BE.
//

import SwiftUI

struct ToastDemoView: View {
    @State private var showToast: Bool = false
    
    var buttonTitle: String {
        showToast ? "Hide Toast" : "Show Toast"
    }
    
    let text: String
    
    var body: some View {
        Button {
            showToast.toggle()
        } label: {
            Text(buttonTitle)
        }
//        .modifier(ToastModifier(text: text, showToast: $showToast))
        .toast(text: text, showToast: $showToast)
    }
}

#Preview {
    ToastDemoView(text: "Toast is delicious!")
}

