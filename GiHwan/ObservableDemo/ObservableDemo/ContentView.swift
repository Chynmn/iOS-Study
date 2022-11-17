//
//  ContentView.swift
//  ObservableDemo
//
//  Created by 강기환 on 2022/11/16.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var timerData: TimerData = TimerData()
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                Text("Timer count = \(timerData.timeCount)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Button(action: resetCount){
                    Text("Reset Counter")
                }
            }
        }
        timerData.resetCount()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
