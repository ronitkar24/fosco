//
//  DailyFactCard2.swift
//  Fosco
//
//  Created by Papai on 10/22/22.
//

import SwiftUI

struct DailyFactCard2: View {
    @State private var showDetail = true
    
    var body: some View {
        HStack {
            VStack() {
                HStack {
                    Text("Oct 20, 2022").font(.title).fontWeight(.bold)
                    Spacer()
                }
                HStack {
                    if showDetail {
                        VStack {
                            HStack {
                                Text("Activity is important with congestive heart failure. Try to walk 30-45 minutes per day. Make sure to take rest when needed!").font(.title3).italic()
                                Image("run").resizable().aspectRatio(contentMode: .fit).frame(width:140)
                            }
                        }
                    }
                }.offset(y:-15)
                
            }
            
            
        }.padding()
    }
}

struct DailyFactCard2_Previews: PreviewProvider {
    static var previews: some View {
        DailyFactCard2()
    }
}
