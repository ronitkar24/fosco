//
//  DailyFactCard.swift
//  Fosco
//
//  Created by Papai on 10/22/22.
//

import SwiftUI

struct DailyFactCard: View {
    @State private var showDetail = false
    
    var body: some View {
        HStack {
            VStack() {
                HStack {
                    Text("Oct 21, 2022").font(.title).fontWeight(.bold)
                    Spacer()
                }
                HStack {
                    if showDetail {
                        VStack {
                            Spacer().frame(height:20)
                            HStack {
                                Text("Choosing food with low sodium leads to better fluid control! Oatmeal is a great, low-sodium alternative for breakfast!").font(.title3).italic()
                                Image("oatmeal").resizable().aspectRatio(contentMode: .fit).frame(width:140)
                            }
                            HStack {
                                Image("fire").resizable().aspectRatio(contentMode: .fit).frame(width:80)
                                VStack(alignment: .leading) {
                                    Text("You're on fire!").font(.largeTitle).fontWeight(.medium)
                                    Text("You've checked 5 facts in a row!")
                                }
                            }.padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(LinearGradient(colors: [.orange, .red],
                                                               startPoint: .top,
                                                               endPoint: .center), lineWidth: 8)
                                )
                        }
                    }else{
                        Button {
                            withAnimation {
                                showDetail.toggle()
                            }
                        } label: {
                            VStack {
                                Spacer().frame(height: 30)
                                Image("gift").resizable()
                                    .aspectRatio(contentMode: .fit).frame(height: 80)
                                Text("Reveal today's daily fact!").font(.title2).foregroundColor(Color.black)
                            }
                        }
                    }
                }.offset(y:-15)
                
            }
            
            
        }.padding()

    }
}

struct DailyFactCard_Previews: PreviewProvider {
    static var previews: some View {
        DailyFactCard()
    }
}
