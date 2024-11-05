//
//  CustomPlusButtonView.swift
//  Day Count
//
//  Created by Dev on 5/11/2567 BE.
//

import SwiftUI

struct CustomPlusButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            .white,
                            Color.primaryButtonColor,
                            Color.primaryButtonColor
                        ],
                        startPoint: .top,
                        endPoint: .bottom)
                )
            Circle()
                .stroke(
                    LinearGradient(
                        colors: [
                            Color.primaryButtonColor,
                            Color.primaryButtonColor.opacity(0.5)],
                        startPoint: .top,
                        endPoint: .bottom),
                    lineWidth: 4)
            Image(systemName: "plus")
                .font(.system(size: 30))
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            Color.primaryText,
                            Color.secondaryText
                        ],
                        startPoint: .top,
                        endPoint: .bottom)
                )
        }
        .frame(width: 58, height: 58)
    }
}

#Preview {
    CustomPlusButtonView()
}
