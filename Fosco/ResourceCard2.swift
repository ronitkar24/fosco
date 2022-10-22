//
//  ResourceCard2.swift
//  Fosco
//
//  Created by Papai on 10/22/22.
//

import SwiftUI

struct ResourceCard2: View {
    var body: some View {
        VStack {
            Image("rcardh")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .gesture(
                    TapGesture()
                        .onEnded { _ in
                            UIApplication.shared.open(URL(string: "https://www.uptodate.com/contents/heart-failure-beyond-the-basics?search=congestive%20heart%20failure&source=search_result&selectedTitle=1~57&usage_type=default&display_rank=1")!)
                        }
                )
            Text("Understanding Congestive Heart Failure")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
        }
        .padding()
        .background(.white)
    }
}

struct ResourceCard2_Previews: PreviewProvider {
    static var previews: some View {
        ResourceCard2()
    }
}
