//
//  SecondView.swift
//  ObservableDemo
//
//  Created by 이정동 on 2022/11/20.
//

import SwiftUI

struct SecondView: View {
    
    @ObservedObject var timerData: TimerData
    
    var body: some View {
        VStack {
            Text("Second Timer Count : \(timerData.timeCount)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Button {
                resetCount()
            } label: {
                Text("Reset Count")
            }

        }
        .padding()
    }
    
    func resetCount() {
        timerData.resetCount()
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(timerData: TimerData())
    }
}
