//
//  ContentView.swift
//  ObservableDemo
//
//  Created by 이정동 on 2022/11/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var timerData: TimerData = TimerData()
    
    @EnvironmentObject var envTimerData: TimerData
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Timer Count : \(envTimerData.timeCount)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Button {
                    resetCount()
                } label: {
                    Text("Reset Count")
                }

                
                NavigationLink {
                    SecondView(timerData: timerData)
                } label: {
                    Text("다음 화면")
                }
            }
            .padding()
        }
    }
    
    func resetCount() {
        timerData.resetCount()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(TimerData())
    }
}
