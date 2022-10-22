//
//  DailyFactCard3.swift
//  Fosco
//
//  Created by Papai on 10/22/22.
//

import SwiftUI

struct DailyFactCard3: View {
    @State private var showDetail = true
    
    var body: some View {
        HStack {
            VStack() {
                HStack {
                    Text("Oct 19, 2022").font(.title).fontWeight(.bold)
                    Spacer()
                }
                HStack {
                    if showDetail {
                        VStack {
                            HStack {
                                Text("The American Heart Association recommends no more than 1 or 2 cups of coffee a day.").font(.title3).italic()
                                Image("coffee").resizable().aspectRatio(contentMode: .fit).frame(width:140)
                            }
                        }
                    }
                }.offset(y:-15)
                
            }
            
            
        }.padding()
    }
}

struct DailyFactCard3_Previews: PreviewProvider {
    static var previews: some View {
        DailyFactCard3()
    }
}
