//
//  MessageView.swift
//  StaticInstagram
//
//  Created by xhiew on 1/4/25.
//

import SwiftUI

struct MessageView: View {
    var body: some View {
        ZStack {
            Color.iYellow.ignoresSafeArea()
            ScrollView {
                Text("MessageView")
            }
        }
    }
}

#Preview {
    MessageView()
}
