//
//  OldDate.swift
//  Fosco
//
//  Created by Papai on 10/22/22.
//

import SwiftUI

struct OldDate: View {
    var body: some View {
        VStack {
            Image("thumbs")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 240)
                .padding()
            Text("You're doing great!").font(.title3).italic().padding(.bottom)
            
            Text("Your last checkup was").font(.title)
            Text("Oct 22, 2022").font(.largeTitle).fontWeight(.bold)
            Text("Today").italic().font(.title3).padding(.bottom)
            
            Text("Your next checkup is").font(.title)
            Text("Oct 29, 2022").font(.largeTitle).fontWeight(.bold)
            Text("7 days from now").italic().font(.title3).padding(.bottom)
            
            
        }
    }
}

struct OldDate_Previews: PreviewProvider {
    static var previews: some View {
        OldDate()
    }
}
