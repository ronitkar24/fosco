//
//  ContentView.swift
//  Fosco
//
//  Created by Papai on 10/22/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer().frame(width: 20)
                Text("FOSCO")
                    .foregroundColor(.white)
                    .fontWeight(.black)
                    .font(.title)
                Spacer()
                Image(systemName: "gear").foregroundColor(.white).imageScale(.large)
                Spacer().frame(width: 20)
            }
                .frame(height: 60)
                .background(.orange)
            
            TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
                ResourcesView().tabItem { Label("Resources", systemImage: "doc.text") }.tag(1)
                DailyFactView().tabItem { Label("Daily Fact", systemImage: "lightbulb") }.tag(2)
                CheckupView(audioRecorder: AudioRecorder()).tabItem { Label("Self-Checkup", systemImage: "person.fill.checkmark") }.tag(3)
                Text("This page is still being developed!").tabItem { Label("Record", systemImage: "trophy") }.tag(4)
            }/*.onAppear {
                let appearance = UITabBarAppearance()
                appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
                appearance.backgroundColor = UIColor(.white)
                
                // Use this appearance when scrolling behind the TabView:
                UITabBar.appearance().standardAppearance = appearance
                // Use this appearance when scrolled all the way up:
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }*/
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
