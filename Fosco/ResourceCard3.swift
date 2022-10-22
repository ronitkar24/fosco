//
//  ResourceCard3.swift
//  Fosco
//
//  Created by Papai on 10/22/22.
//

import SwiftUI

struct ResourceCard3: View {
    var body: some View {
        VStack {
            Image("rcard2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .gesture(
                    TapGesture()
                        .onEnded { _ in
                            UIApplication.shared.open(URL(string: "https://www.health.state.mn.us/people/conditions/getcare.html")!)
                        }
                )
            Text("Medical Care in a Pandemic")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
        }
        .padding()
        .background(.white)
    }
}

struct ResourceCard3_Previews: PreviewProvider {
    static var previews: some View {
        ResourceCard3()
    }
}
