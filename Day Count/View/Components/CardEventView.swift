//
//  CardEventView.swift
//  Day Count
//
//  Created by Dev on 4/11/2567 BE.
//

import SwiftUI

struct CardEventView: View {
    
    var onOpen: () -> Void
    
    var body: some View {
        Button(action: {
            onOpen()
        }, label: {
            ZStack {
                Image(uiImage: .testBanner)
                    .resizable()
                    .frame(height: 100)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(RoundedRectangle(cornerRadius: 16.0))
                    .clipped()
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(.pink)
                                .frame(width: 20, height: 20)
                            VStack(alignment: .leading, spacing: -4) {
                                Text("Test")
                                    .foregroundColor(.white)
                                    .font(.title3)
                                Text("Date")
                                    .foregroundColor(.white)
                                    .font(.caption)
                            }
                        }
                        .padding([.top, .leading], 12)
                        Spacer()
                    }
                    Spacer()
                    VStack {
                        Spacer()
                        Text("1")
                            .foregroundColor(.white)
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding([.bottom, .trailing], 12.0)
                    }
                }
            }
        })
        .frame(height: 100)
        .frame(maxWidth: .infinity)
    }
}

struct CardEventView_Previews: PreviewProvider {
    static var previews: some View {
        CardEventView(onOpen: {
            return
        })
            .previewLayout(.sizeThatFits)
    }
}
