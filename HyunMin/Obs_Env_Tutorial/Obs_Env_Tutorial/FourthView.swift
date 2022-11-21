//
//  FourthView.swift
//  Obs_Env_Tutorial
//
//  Created by /Chynmn/M1 pro—̳͟͞͞♡ on 2022/11/15.
//

import SwiftUI

struct FourthView: View {
    
    @EnvironmentObject var timerData: TimerData
    
    var body: some View {
        VStack {
            Text("Fourth View")
                .font(.largeTitle)
            Text("Timer Count = \(timerData.timeCount)")
                .font(.headline)
        }
        .padding()
    }
}

struct FourthView_Previews: PreviewProvider {
    static var previews: some View {
        FourthView().environmentObject(TimerData())
    }
}
