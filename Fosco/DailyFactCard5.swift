//
//  DailyFactCard5.swift
//  Fosco
//
//  Created by Papai on 10/22/22.
//

import SwiftUI

struct DailyFactCard5: View {
    @State private var showDetail = true
    
    var body: some View {
        HStack {
            VStack() {
                HStack {
                    Text("Oct 17, 2022").font(.title).fontWeight(.bold)
                    Spacer()
                }
                HStack {
                    if showDetail {
                        VStack {
                            HStack {
                                Text("You're not alone! There are many others like you trying to stay healthy. Click the heart to the right to see a forum of others with your condition.").font(.title3).italic()
                                Image("hearty").resizable().aspectRatio(contentMode: .fit).frame(width:140)
                                    .gesture(
                                        TapGesture()
                                            .onEnded { _ in
                                                UIApplication.shared.open(URL(string: "https://supportnetwork.heart.org/s/topic/0TO4T000000TY2HWAW/heart-failure")!)
                                            }
                                    )
                            }
                        }//
                    }
                }.offset(y:-15)
                
            }
            
            
        }.padding()
    }
}

struct DailyFactCard5_Previews: PreviewProvider {
    static var previews: some View {
        DailyFactCard5()
    }
}
