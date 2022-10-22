//
//  ResourceCard.swift
//  Fosco
//
//  Created by Papai on 10/22/22.
//

import SwiftUI
import SafariServices

struct ResourceCard: View {
    @State private var shouldShow = false
    var body: some View {
        VStack {
            Image("rcard1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .gesture(
                    TapGesture()
                        .onEnded { _ in
                            shouldShow.toggle()
                        }
                )
            Text("Taking Control of Your Own Medical Care")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            if shouldShow {
                Text("Having patient autonomy means that you are making your own healthcare decisions and that you are educated and informed on your condition. This has been studied by experts and shown that patients who are engaged with and take control of their own care have better health outcomes.").padding()
            }
        }
        .padding()
        .background(.white)
    }
}

struct ResourceCard_Previews: PreviewProvider {
    static var previews: some View {
        ResourceCard()
    }
}
