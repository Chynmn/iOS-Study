//
//  ObservableDemoApp.swift
//  ObservableDemo
//
//  Created by 이정동 on 2022/11/20.
//

import SwiftUI

@main
struct ObservableDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(TimerData())
        }
    }
}
