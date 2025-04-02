//
//  PersonalView.swift
//  StaticInstagram
//
//  Created by xhiew on 1/4/25.
//

import SwiftUI

struct PersonalView: View {
    var body: some View {
        ZStack {
            Color.iYellow.ignoresSafeArea()
            ScrollView {
                Text("PersonalView")
            }
        }
    }
}

#Preview {
    PersonalView()
}
