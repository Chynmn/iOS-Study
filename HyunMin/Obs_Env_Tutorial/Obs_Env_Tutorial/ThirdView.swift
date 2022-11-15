//
//  ThirdView.swift
//  Obs_Env_Tutorial
//
//  Created by /Chynmn/M1 pro—̳͟͞͞♡ on 2022/11/15.
//

import SwiftUI

struct ThirdView: View {
    @EnvironmentObject var timerData: TimerData

    var body: some View {
        
        NavigationView {
                VStack {
                    Text("Timer count = \(timerData.timeCount)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    Button(action: resetCount) {
                        Text("Reset Counter")
                    }
                    NavigationLink(destination: FourthView()) {
                        Text("Next Screen")
                    }
                    .padding()
                }
            }
        }
    func resetCount() {
        timerData.resetCount()
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView().environmentObject(TimerData())
    }
}
