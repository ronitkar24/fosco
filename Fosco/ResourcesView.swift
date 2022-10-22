//
//  ResourcesView.swift
//  Fosco
//
//  Created by Papai on 10/22/22.
//

import SwiftUI

struct ResourcesView: View {
    @State private var showRDetail = true
    var body: some View {
        
        
        ScrollView{
            
            
            
            VStack {
                HStack {
                    Text("Welcome back, Papai!")
                        .font(.largeTitle)
                    .fontWeight(.medium)
                    //Image(systemName: "party.popper").imageScale(.large)
                }
                Spacer().frame(height: 8)
                Image("wavingguy")
                    .resizable()
                    .frame(width: 324, height: 180)
                
                if showRDetail {
                    
                    Text("How are you feeling today?")
                        .font(.title2)
                    Spacer().frame(height: 12)
                    HStack(){
                        Button(action: {
                            withAnimation {
                                showRDetail.toggle()
                            }
                        }) {
                            HStack {
                                Text("Depressed")
                                    .fontWeight(.medium)
                                    .foregroundColor(Color.blue)
                                    .italic()
                                    .padding(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.blue, lineWidth: 1)
                                    )
                                Text("Sad")
                                    .fontWeight(.medium)
                                    .foregroundColor(Color.teal)
                                    .italic()
                                    .padding(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.teal, lineWidth: 1)
                                    )
                                Text("Neutral")
                                    .fontWeight(.medium)
                                    .foregroundColor(Color(red: 0.4, green: 0.9, blue: 0.9))
                                    .italic()
                                    .padding(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color(red: 0.3, green: 0.8, blue: 0.8), lineWidth: 1)
                                    )
                                Text("Good")
                                    .fontWeight(.medium)
                                    .foregroundColor(Color(red: 0.3, green: 0.9, blue: 0.4))
                                    .italic()
                                    .padding(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color(red: 0.3, green: 0.9, blue: 0.4), lineWidth: 1)
                                    )
                                Text("Happy")
                                    .fontWeight(.medium)
                                    .foregroundColor(Color.green)
                                    .italic()
                                    .padding(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.green, lineWidth: 1)
                                    )
                            }
                        }
                    }
                }else{
                    Text("Thanks for letting us know, Papai.")
                        .font(.title2)
                }
                
            }.padding()
            VStack {
                ResourceCard().cornerRadius(20).padding()
                ResourceCard2().cornerRadius(20).padding()
                ResourceCard4().cornerRadius(20).padding()
                ResourceCard3().cornerRadius(20).padding()
            }
            .padding()
            .background(Color(red: 1.0, green: 0.876, blue: 0.749))
        }
    }
}

struct ResourcesView_Previews: PreviewProvider {
    static var previews: some View {
        ResourcesView()
    }
}
