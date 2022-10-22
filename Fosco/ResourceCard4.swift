//
//  ResourceCard4.swift
//  Fosco
//
//  Created by Papai on 10/22/22.
//

import SwiftUI
import SafariServices

struct ResourceCard4: View {
    @State private var shouldShowR = false
    var body: some View {
        VStack {
            Image("waterdrop")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .gesture(
                    TapGesture()
                        .onEnded { _ in
                            shouldShowR.toggle()
                        }
                )
            Text("What is Fluid/Volume Status?")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            if shouldShowR {
                Text("Fluid status in your body is how much excess fluids are in your body that aren’t supposed to be there. For conditions like COPD, heart failure, kidney disease, and more, fluid status is an important indicator of a need for hospitalization or medical intervention. The checkups done for this issue are also quite simple. It’s as easy as noting if there’s been a sudden weight change, and seeing if you push your thumb into your ankle if it stays pitted and concave, as well as listening for crackling in the lungs. There’s also some other tests, but if these three are in effect, then we can say with a good amount of certainty that there is a fluid overload. Excess fluid in your body can lead to hospitalizations and other complications, so being able to do a checkup for this on your own and lead to fewer unnecessary hospital and doctor visits.").padding()
            }
        }
        .padding()
        .background(.white)
    }
}

struct ResourceCard4_Previews: PreviewProvider {
    static var previews: some View {
        ResourceCard4()
    }
}
