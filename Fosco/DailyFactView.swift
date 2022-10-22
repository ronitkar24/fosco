//
//  DailyFactView.swift
//  Fosco
//
//  Created by Papai on 10/22/22.
//

import SwiftUI

struct DailyFactView: View {
    var body: some View {
        ScrollView {
            DailyFactCard().padding(.bottom, -10)
            DailyFactCard2().padding(.bottom, -20)
            DailyFactCard5().padding(.bottom, -10)
            DailyFactCard3().padding(.bottom, -25)
            
            DailyFactCard4().padding(.bottom, -10)
            
        }
    }
}

struct DailyFactView_Previews: PreviewProvider {
    static var previews: some View {
        DailyFactView()
    }
}
