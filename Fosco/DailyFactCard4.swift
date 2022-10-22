//
//  DailyFactCard4.swift
//  Fosco
//
//  Created by Papai on 10/22/22.
//

import SwiftUI

struct DailyFactCard4: View {
    @State private var showDetail = true
    
    var body: some View {
        HStack {
            VStack() {
                HStack {
                    Text("Oct 18, 2022").font(.title).fontWeight(.bold)
                    Spacer()
                }
                HStack {
                    if showDetail {
                        VStack {
                            HStack {
                                Text("Studies show that meditating for 15-20 minutes a day help people with congestive heart failure reduce stress levels!").font(.title3).italic()
                                Image("yoga").resizable().aspectRatio(contentMode: .fit).frame(width:140)
                            }
                        }
                    }
                }.offset(y:-15)
                
            }
            
            
        }.padding()
    }
}

struct DailyFactCard4_Previews: PreviewProvider {
    static var previews: some View {
        DailyFactCard4()
    }
}
